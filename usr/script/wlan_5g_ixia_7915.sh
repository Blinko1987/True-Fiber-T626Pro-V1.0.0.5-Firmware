#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

/usr/bin/killall -9 usb_auto_mount
/usr/bin/killall -9 bandwidth
/usr/bin/killall -9 jvm_monitor
/usr/bin/killall -9 smbd
/usr/bin/killall -9 nmbd
/usr/bin/killall -9 java
/usr/bin/killall -9 mobile-manager
/usr/bin/killall -9 bundle_monitor
/usr/bin/killall -9 usb_monitor
/usr/bin/killall -9 udhcpc
/bin/echo dis_ddmi > /proc/pon_phy/debug
/sbin/ifconfig ra0 down
/bin/echo 15000 4096 > /proc/net/skbmgr_hot_list_len
/bin/echo 16384 > /proc/tc3162/sw_rps_queue_len
killall tr69
killall dnshost
killall udhcpc
killall plugin_monitor
killall -9 upnpd
killall -9 udhcpd
killall -9 radvd
killall -9 xl2tpd
killall -9 lan_host_mgr
killall -9 alink-mgr
/userfs/bin/iwpriv rai0 set ForceShortGI=1
/userfs/bin/iwpriv rai0 set PowerDropCtrl=30
/userfs/bin/iwpriv rai0 set FlagForKeepAlive=1
/userfs/bin/iwpriv rai0 set fcont=1
/userfs/bin/iwpriv rai0 set rxDetectFlag=0
/userfs/bin/iwpriv rai0 set txDetectFlag=0
/userfs/bin/iwpriv rai0 set flushone_timeout=1000
/userfs/bin/iwpriv rai0 set flushall_timeout=1000
/bin/echo 1 > /proc/tc3162/sw_rps_ixia_tx
/userfs/bin/irqCpuBind set pcie1 0
/userfs/bin/irqCpuBind set pcie0 0
/userfs/bin/irqCpuBind set qdma_lan2 2
/userfs/bin/irqCpuBind set qdma_lan3 3
/userfs/bin/irqCpuBind set qdma_lan0 3
DelayTVal=`/userfs/bin/tcapi get WLan11ac_Common DelayTest`
if [ "$DelayTVal" = "1" ]; then
/bin/echo 0 2 1 1 > /proc/tc3162/sw_rps
echo 1 5 1 0 0 0 0 0 0 0 > /proc/tc3162/ixia_txrx
/bin/echo 0 1 1 > /proc/tc3162/rps_enable
else
/bin/echo 1 2 1 1 > /proc/tc3162/sw_rps
echo 1 5 1 1 450 0 0 0 0 0 > /proc/tc3162/ixia_txrx
/bin/echo 0 0 0 > /proc/tc3162/rps_enable
fi
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 300 300 300 300
/bin/echo 1 50 50 0 0 > /proc/tc3162/sw_rps_cls
if [ "$TCSUPPORT_CPU_EN7528" != "" ] ;then
/usr/bin/sys memwl bfb550a0 200700fa
fi
if [ "$TCSUPPORT_CPU_EN7580" != "" ] ;then
/usr/bin/sys memwl bfb570a0 200700fa
fi
/usr/bin/brctl setageing br0 10000
/userfs/bin/iwpriv rai0 set pkthd=50
/userfs/bin/iwpriv rai0 mac 820f2098=04001000
kill -23 `cat /var/run/wan_related_svc.pid`
kill -23 `cat /var/run/other_svc.pid`
kill -23 `cat /var/run/central_ctrl_svc.pid`
kill -23 `cat /var/run/wlan_svc.pid`
kill -23 `cat /var/run/voip_svc.pid`

