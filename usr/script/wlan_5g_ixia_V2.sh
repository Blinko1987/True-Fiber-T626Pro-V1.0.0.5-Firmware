#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

/usr/bin/killall -9 usb_auto_mount
/usr/bin/killall -9 bandwidth
#/usr/bin/killall -9 tcwdog
/usr/bin/killall -9 jvm_monitor
/usr/bin/killall -9 smbd
/usr/bin/killall -9 nmbd
/usr/bin/killall -9 java
/usr/bin/killall -9 mobile-manager
/usr/bin/killall -9 bundle_monitor
/usr/bin/killall -9 usb_monitor
/usr/bin/killall -9 udhcpc
/sbin/ifconfig ra0 down
/sbin/ifconfig ra1 down
/sbin/ifconfig apcli0 down
/sbin/ifconfig apclii0 down
/sbin/rmmod /lib/modules/np_lanhost_mgr.ko
/userfs/bin/tcapi set Apcli_Common StartConn 0
/bin/echo 1 > /proc/tc3162/sw_rps_ixia_tx
/bin/echo dis_ddmi > /proc/pon_phy/debug
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 300 300 300 300
/bin/echo 15000 > /proc/net/skbmgr_hot_list_len
/bin/echo 33000 > /proc/net/skbmgr_driver_max_skb
/bin/echo 22000 > /proc/net/skbmgr_limit
/bin/echo 11000 > /proc/net/skbmgr_4k_limit

/bin/echo 9500 > /proc/tc3162/sw_rps_queue_len

echo 1 50 50 3 1 > /proc/tc3162/sw_rps_cls
echo 1 5 1 1 450 1 0 0 0 > /proc/tc3162/ixia_txrx
/bin/echo 0 > /proc/tc3162/sync_type
/bin/echo 0 1 1 > /proc/tc3162/rps_enable

/userfs/bin/irqCpuBind set pcie0 1
/userfs/bin/irqCpuBind set qdma_lan0 3
/userfs/bin/irqCpuBind set qdma_lan2 3
/userfs/bin/irqCpuBind set qdma_lan3 2
/userfs/bin/irqCpuBind set pcie1 1
/bin/echo 8 > /proc/irq/5/smp_affinity
/bin/echo 1 2 1 0 > /proc/tc3162/sw_rps

kill -23 `cat /var/run/wan_related_svc.pid`
kill -23 `cat /var/run/other_svc.pid`
kill -23 `cat /var/run/central_ctrl_svc.pid`
kill -23 `cat /var/run/wlan_svc.pid`
killall tr69
killall dnshost
killall udhcpc
killall plugin_monitor
#killall -9 dnsmasq
killall -9 upnpd
killall -9 udhcpd
killall -9 radvd
killall -9 xl2tpd
killall -9 lan_host_mgr
killall -9 alink-mgr
/userfs/bin/iwpriv rai0 set ForceShortGI=1
/userfs/bin/iwpriv rai0 set PowerDropCtrl=30

echo 1 2000 1 > /proc/tc3162/wifi5g_IxiaTx
/bin/echo 1000 > /proc/sys/vm/min_free_kbytes

/userfs/bin/iwpriv rai0 set HtProtect=0
/userfs/bin/iwpriv rai0 set BGProtection=2
/userfs/bin/iwpriv rai0 mac 2205c=fe0fffff

txopEnVal=`/userfs/bin/tcapi get WLan11ac_Common txopEn`
if [ ${txopEnVal}=="Yes" ]; then
	/userfs/bin/iwpriv rai0 set manual_txop=1
	/userfs/bin/iwpriv rai0 mac 24014=03ff0000
fi

/userfs/bin/iwpriv rai0 mac 820fd008=03ff3fff

/userfs/bin/iwpriv rai0 set IdleTimeout=20000
/userfs/bin/iwpriv rai0 set rx1_max_cnt=64
/userfs/bin/iwpriv rai0 set flushone_timeout=1000
/userfs/bin/iwpriv rai0 set flushall_timeout=1000

if [ "$TCSUPPORT_NP_RAM_SHRINK" != "" ] ;then
echo 1 5 1 1 1400 1 0 0 0 > /proc/tc3162/ixia_txrx
/bin/echo 5500 > /proc/net/skbmgr_limit
/bin/echo 3000 > /proc/net/skbmgr_4k_limit
/bin/echo 128 > /proc/net/skbmgr_hot_list_len
/bin/echo 3000 > /proc/tc3162/sw_rps_queue_len
/bin/echo 3 > /proc/sys/vm/drop_caches
fi
/userfs/bin/iwpriv rai0 set fcont=1

