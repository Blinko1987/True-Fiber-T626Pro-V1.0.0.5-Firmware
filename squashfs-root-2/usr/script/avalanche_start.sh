#!/bin/sh

/userfs/bin/tcapi set firewall_Entry firewall_status 0
/userfs/bin/tcapi set firewall_Entry firewall_level low
/userfs/bin/tcapi set firewall_Entry spi_status 0
/userfs/bin/tcapi commit firewall_Entry
/userfs/bin/tcapi save

/usr/bin/accesslimitcmd mode 0

/bin/echo 10 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_time_wait
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_fin_wait
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close_wait
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_recv
/bin/echo 30 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
/bin/echo 65536 >/sys/module/nf_conntrack/parameters/hashsize
/bin/echo 524288 > /proc/sys/net/nf_conntrack_max
/bin/echo 4096 > /sys/class/net/br0/bridge/hash_max

/userfs/bin/qdmamgr_lan set rxratelimit config Disable Packet
/userfs/bin/qdmamgr_wan set rxratelimit config Disable Packet

/userfs/bin/hw_nat -T 1
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 1 1 1 1
/usr/bin/sys memwl 1fb50e08 000f000c
/usr/bin/sys memwl 1fb50e1c ef300fb4
/usr/bin/sys memwl 1fb50e2c 3fff3fff
/usr/bin/sys memwl 1fb50e30 00013fff
/usr/bin/sys memwl 1fb550a4 39993000
/usr/bin/sys memwl 1fb570a4 39993000

/bin/echo 1 > /proc/tc3162/hwnat_force_fast_lan

/sbin/insmod /lib/modules/swnat.ko
/bin/echo 1000 > /proc/tc3162/swnat_entry_life
/bin/echo 0 3 8 > /proc/tc3162/swnat_foe_tbl
/bin/echo 0x0145 > /proc/tc3162/swnat_test_flag

/bin/echo clear > /proc/ifc_debug

/bin/echo 3 > /proc/tc3162/hwnat_fast_bind

/bin/echo 0 > /tmp/lanhost_dbg
