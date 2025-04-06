#!/bin/sh

if [ $# != 4 ] ; then
        echo "usage: $0 [interface name]"
        exit 0
fi

#PVC=$1
PRE_NATLOOPBACK_CHAIN=PRE_NATLOOPBACK_$1
POST_NATLOOPBACK_CHAIN=POST_NATLOOPBACK_$1
WAN_IF=$1
LAN_IP=$2
LAN_NETMASK=$3
WAN_IP=$4

iptables -t nat -F $PRE_NATLOOPBACK_CHAIN
iptables -t nat -F $POST_NATLOOPBACK_CHAIN

NATLOOPBACK_CONF=/var/run/$WAN_IF/natloopback
if [ -f $NATLOOPBACK_CONF ] ; then
        chmod +x $NATLOOPBACK_CONF
        . $NATLOOPBACK_CONF
else
	exit 0
fi

if [ "$Active" = "Yes" ] ; then
	iptables -t nat -A $PRE_NATLOOPBACK_CHAIN -i $WAN_IF -p tcp -j DNAT --to $NatLoopback_IP
	iptables -t nat -A $PRE_NATLOOPBACK_CHAIN -i br0 -d $WAN_IP -p tcp -j DNAT --to $NatLoopback_IP
	iptables -t nat -A $POST_NATLOOPBACK_CHAIN -s $LAN_IP/$LAN_NETMASK -d $NatLoopback_IP -p tcp -j SNAT --to $LAN_IP
fi