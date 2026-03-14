#!/bin/sh
#To build 6rd tunnel
#Usage:./ipv6rd_start.sh 

if [ $# != 5 ] ; then
	echo "usage: $0 CE_address 6rd_prefix prefix_length BR_address IPV6RDAddr"
	exit 0
fi
CE_ADDR=$1
PREFIX=$2
PREFIX_LEN=$3
BR_ADDR=$4
IPV6RDAddr=$5

TUNNEL_NAME="6rd"

/usr/bin/ip -6 route flush dev $TUNNEL_NAME

/usr/bin/ip link set dev $TUNNEL_NAME down

/usr/bin/ip -6 tunnel del $TUNNEL_NAME

/usr/bin/ip tunnel add $TUNNEL_NAME mode sit local $CE_ADDR ttl 255

/usr/bin/ip tunnel 6rd dev $TUNNEL_NAME 6rd-prefix $PREFIX/$PREFIX_LEN

/usr/bin/ip link set $TUNNEL_NAME up

/usr/bin/ip -6 addr add $IPV6RDAddr dev $TUNNEL_NAME

/usr/bin/ip -6 route add ::/0 via ::$BR_ADDR dev $TUNNEL_NAME


exit 0
