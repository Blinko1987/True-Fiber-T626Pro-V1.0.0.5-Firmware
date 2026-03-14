#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

. /usr/script/lib_kernel

KERNEL_DIR=`kernel_get_kernel_dir`

insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebtables.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebtable_filter.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_ip.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_ip6.ko
insmod $KERNEL_DIR/kernel/net/netfilter/xt_layer7.ko
if [ "$TCSUPPORT_ANDLINK" != "" ] ;then
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebtable_broute.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_redirect.ko
echo 60 > /proc/tc3162/workmgr_limit
fi

if [  "$TCSUPPORT_CT_PORTAL_MANAGEMENT" != "" ] ;then
insmod $KERNEL_DIR/kernel/net/ipv4/netfilter/ipt_REDIRECT.ko
fi

if [  "$TCSUPPORT_CT_VLAN_BIND" != "" ] ;then
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebtable_broute.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_mark.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_mark_m.ko
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_vlan.ko
fi

if [ "$TCSUPPORT_CT_BRIDGEARP_NOFWD_LAN" != "" ] ;then
insmod $KERNEL_DIR/kernel/net/bridge/netfilter/ebt_arp.ko
fi