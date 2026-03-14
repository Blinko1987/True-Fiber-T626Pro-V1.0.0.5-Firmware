#!/bin/sh

/userfs/bin/tcapi set firewall_Entry firewall_status 1
/userfs/bin/tcapi set firewall_Entry firewall_level high
/userfs/bin/tcapi set firewall_Entry spi_status 1
/userfs/bin/tcapi commit firewall_Entry
/userfs/bin/tcapi save

/userfs/bin/tcapi commit Accesslimit

/bin/echo 120 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_time_wait
/bin/echo 120 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_fin_wait
/bin/echo 60 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close_wait
/bin/echo 10 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close
/bin/echo 60 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_recv
/bin/echo 432000 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
/bin/echo 15904 >/sys/module/nf_conntrack/parameters/hashsize
/bin/echo 8192 > /proc/sys/net/nf_conntrack_max
/bin/echo 512 > /sys/class/net/br0/bridge/hash_max

/userfs/bin/qdmamgr_lan set rxratelimit config Enable packet
/userfs/bin/qdmamgr_wan set rxratelimit config Enable packet

/userfs/bin/hw_nat -T 3
/userfs/bin/hw_nat -N 30
/userfs/bin/hw_nat -U 15 15 15 15
/usr/bin/sys memwl 1fb50e08 000f000f
/usr/bin/sys memwl 1fb50e1c ef303fb4
/usr/bin/sys memwl 1fb50e2c 0fa00fa0
/usr/bin/sys memwl 1fb50e30 00011f40
/usr/bin/sys memwl 1fb550a4 39992000
/usr/bin/sys memwl 1fb570a4 39992000

/bin/echo 0 > /proc/tc3162/hwnat_force_fast_lan

/sbin/rmmod swnat.ko

/bin/echo reinit > /proc/ifc_debug

/bin/echo 0 > /proc/tc3162/hwnat_fast_bind
