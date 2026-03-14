#!/bin/sh

if [ $# != 1 ] ; then
        echo "usage: $0 [interface name]"
        exit 0
fi

#PVC=$1
DMZ_CHAIN=DMZ_$1
WAN_IF=$1
DMZ_POST_CHAIN=DMZ_POST_$1

iptables -t nat -F $DMZ_CHAIN
iptables -t nat -F $DMZ_POST_CHAIN

# get ipmode (Single or Multiple)
#IPMODE_CONF=/etc/nat_pvc$PVC/ipmode
#if [ -f $IPMODE_CONF ] ; then
#        chmod +x $IPMODE_CONF
#        . $IPMODE_CONF
#fi
SERVER_IP="0.0.0.0"
#if [ "$IPMODE" = "Multiple" ] ; then
#	SERVERIP_CONF=/etc/nat_pvc$PVC/server_ip
#	if [ -f $SERVERIP_CONF ] ; then
#        	chmod +x $SERVERIP_CONF
#        	. $SERVERIP_CONF
#	fi
#fi


#DMZ_CONF=/etc/nat_pvc$PVC/dmz
DMZ_CONF=/var/run/$WAN_IF/dmz
if [ -f $DMZ_CONF ] ; then
        chmod +x $DMZ_CONF
        . $DMZ_CONF
else
	exit 0
fi

NatLoopbackEnable=`/userfs/bin/tcapi get NatLoopback_Common Enable`
WAN_IP=`cat /var/run/$WAN_IF/ip`
LAN_IP=`/userfs/bin/tcapi get Lan_Entry IP`
LAN_NETMASK=`/userfs/bin/tcapi get Lan_Entry netmask`

if [ "$Active" = "Yes" ] ; then
    if [ "$SERVER_IP" = "0.0.0.0" ] ; then
	iptables -t nat -I $DMZ_CHAIN -p all -i $WAN_IF -j DNAT --to $DMZ_IP
		if [ "$NatLoopbackEnable" = "Yes" ] ;then
			iptables -t nat -I $DMZ_CHAIN -p all -i br0 -d $WAN_IP -j DNAT --to $DMZ_IP
			iptables -t nat -I $DMZ_POST_CHAIN -s $LAN_IP/$LAN_NETMASK -d $DMZ_IP -p all -j SNAT --to $LAN_IP
		fi
    else
	iptables -t nat -I $DMZ_CHAIN -p all -d $SERVER_IP -j DNAT --to $DMZ_IP
    fi
fi
