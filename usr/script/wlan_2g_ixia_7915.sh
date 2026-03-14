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
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 300 300 300 300
/bin/echo 15000 4096 > /proc/net/skbmgr_hot_list_len
/bin/echo 9500 > /proc/tc3162/sw_rps_queue_len
/userfs/bin/irqCpuBind set pcie0 0
/userfs/bin/irqCpuBind set pcie1 0
/userfs/bin/irqCpuBind set qdma_lan0 3
/userfs/bin/irqCpuBind set qdma_lan2 3
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
/userfs/bin/iwpriv ra0 set ForceShortGI=1
/userfs/bin/iwpriv ra0 set PowerDropCtrl=30
/userfs/bin/iwpriv ra0 set FlagForKeepAlive=1
/userfs/bin/iwpriv ra0 set fcont=1
/userfs/bin/iwpriv ra0 set flushone_timeout=1000
/userfs/bin/iwpriv ra0 set flushall_timeout=1000
/bin/echo 0 5 0 1 450 0 0 0 1 0 > /proc/tc3162/ixia_txrx
/bin/echo 1 2 1 1 > /proc/tc3162/sw_rps_2g
/bin/echo 1 50 50 0 0 > /proc/tc3162/sw_rps_cls
/bin/echo 0 > /proc/tc3162/sw_rps_ixia_tx
/usr/bin/brctl setageing br0 10000
/userfs/bin/iwpriv ra0 mac 820e2098=04001000
