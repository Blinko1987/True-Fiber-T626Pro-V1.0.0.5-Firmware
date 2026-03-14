#!/bin/sh


TUNNEL_NAME="6rd"

/usr/bin/ip -6 route flush dev $TUNNEL_NAME

/usr/bin/ip link set dev $TUNNEL_NAME down

/usr/bin/ip -6 tunnel del $TUNNEL_NAME


exit 0
