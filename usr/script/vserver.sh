#!/bin/sh

if [ $# != 3 ] ; then
        echo "usage: $0 [add/del] [interface name#] [Rule#]"
        exit 0
fi

if [ $1 = "add" ] ; then
        OPT=-I
elif [ $1 = "del" ] ; then
        OPT=-D
else
        echo "usage: $0 [add/del] [interface name#] [Rule#]"
        exit 0
fi

#PVC=$2
WAN_IF=$2
VS_CHAIN=VS_$WAN_IF
RULE=$3
VS_POST_CHAIN=VS_POST_$WAN_IF

#VS_CONF=/etc/nat_pvc$PVC/vserver$RULE
VS_CONF=/var/run/$WAN_IF/vserver$RULE
if [ -f $VS_CONF ] ; then
        chmod +x $VS_CONF
        . $VS_CONF
else
	exit 0
fi

EXT_SPORT=$STARTPORT
EXT_EPORT=$ENDPORT
INT_OLD_PORT=$INTPORT
INT_SPORT=$INTSTARTPORT
INT_EPORT=$INTENDPORT
INT_IP=$LOCALIP
IP_PROTOCAL=$Protocal

if [ "${INT_SPORT}" = "" ] || [ ${INT_SPORT} -lt "0" ] || [ ${INT_SPORT} -eq "0" ]; then 
	INT_SPORT=$INT_OLD_PORT
fi

if [ "${EXT_EPORT}" = "" ] || [ ${EXT_EPORT} -lt "0" ] || [ ${EXT_EPORT} -eq "0" ]; then 
	EXT_EPORT=$EXT_SPORT
else 
	EXT_EPORT=$EXT_SPORT":"$EXT_EPORT
fi
if [ "${INT_EPORT}" = "" ] || [ ${INT_EPORT} -lt "0" ] || [ ${INT_EPORT} -eq "0" ]; then 
	INT_EPORT=":"$INT_SPORT
else 
	INT_EPORT=":"$INT_SPORT"-"$INT_EPORT
fi

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

NatLoopbackEnable=`/userfs/bin/tcapi get NatLoopback_Common Enable`
WAN_IP=`cat /var/run/$WAN_IF/ip`
LAN_IP=`/userfs/bin/tcapi get Lan_Entry IP`
LAN_NETMASK=`/userfs/bin/tcapi get Lan_Entry netmask`

if [ "$SERVER_IP" = "0.0.0.0" ] ; then
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat -D $VS_CHAIN -p tcp --dport $EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP$INT_EPORT
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp --dport $EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP$INT_EPORT
		echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat -D $VS_CHAIN -p udp --dport $EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP$INT_EPORT
		echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp --dport $EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP$INT_EPORT
if [ "$NatLoopbackEnable" = "Yes" ] ;then
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat -D $VS_CHAIN -p tcp -i br0 --dport $EXT_EPORT -d $WAN_IP -j DNAT --to $INT_IP$INT_EPORT
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp -i br0 --dport $EXT_EPORT -d $WAN_IP -j DNAT --to $INT_IP$INT_EPORT
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat -D $VS_POST_CHAIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p tcp -j SNAT --to $LAN_IP
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_POST_CHAIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p tcp -j SNAT --to $LAN_IP
		echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat -D $VS_CHAIN -p udp -i br0 --dport $EXT_EPORT -d $WAN_IP -j DNAT --to $INT_IP$INT_EPORT
		echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp -i br0 --dport $EXT_EPORT -d $WAN_IP -j DNAT --to $INT_IP$INT_EPORT
else
		iptables -t nat -D $VS_CHAIN -p tcp -i br0 --dport $EXT_EPORT -d $WAN_IP -j DNAT --to $INT_IP$INT_EPORT
		iptables -t nat -D $VS_POST_CHAIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p tcp -j SNAT --to $LAN_IP
		iptables -t nat -D $VS_CHAIN -p udp -i br0 --dport $EXT_EPORT -d $WAN_IP -j DNAT --to $INT_IP$INT_EPORT
fi
else
		echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp --dport $EXT_EPORT -d $SERVER_IP -s 0/0  -j DNAT --to $LAN_IP
		echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp --dport $EXT_EPORT -d $SERVER_IP -s 0/0  -j DNAT --to $LAN_IP
fi

