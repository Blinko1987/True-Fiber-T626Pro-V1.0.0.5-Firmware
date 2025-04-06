killall -9 usb_auto_mount
killall -9 bandwidth
killall -9 tcwdog
killall -9 jvm_monitor
killall -9 smbd
killall -9 nmbd
killall -9 java
killall -9 mobile-manager
killall -9 bundle_monitor
ifconfig ra0 down
/bin/echo 8 >/proc/irq/22/smp_affinity
/bin/echo 7 >/proc/irq/24/smp_affinity
/bin/echo 7 >/proc/irq/25/smp_affinity

/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 300 300 300 300
/bin/echo 15000 > /proc/net/skbmgr_hot_list_len
/bin/echo 228000 > /proc/net/skbmgr_driver_max_skb
/bin/echo 200000 > /proc/net/skbmgr_limit
/bin/echo 70000 > /proc/net/skbmgr_4k_limit
/bin/echo 0 1 2 > /proc/tc3162/lan_tx
/userfs/bin/iwpriv rai0 set ShortcutQTime=10
/userfs/bin/iwpriv rai0 set BeaconPeriod=500
/userfs/bin/iwpriv rai0 set ShortcutQSize=1024
/userfs/bin/iwpriv rai0 set autoShortcutFlag=0
/userfs/bin/iwpriv rai0 set txDetectFlag=0
/userfs/bin/iwpriv rai0 set ShortcutFlag=1
/userfs/bin/iwpriv rai0 set TxBurst=1
/userfs/bin/iwpriv rai0 set HtRdg=1
/userfs/bin/iwpriv rai0 set ShortcutMaxSkb=120000
/userfs/bin/iwpriv rai0 set ShortcutQMax=100000
/userfs/bin/iwpriv rai0 set DisableRTSCTS=1
/userfs/bin/iwpriv rai0 set EnableCTS=1
/userfs/bin/iwpriv rai0 set ShortCutV2NeedLock=0
/userfs/bin/iwpriv rai0 set ShortCutV2DequeueLock=1
/userfs/bin/iwpriv rai0 set ShortCutV2Enhance=1
/userfs/bin/iwpriv rai0 set MaxRxProcessCnt=1024
/userfs/bin/iwpriv rai0 set flushone_timeout=1000
/userfs/bin/iwpriv rai0 set flushall_timeout=1000
/userfs/bin/iwpriv rai0 set ForceShortGI=1
/userfs/bin/iwpriv rai0 mac 1300=0007315e
/userfs/bin/iwpriv rai0 set DisableRTSCTS=0
/userfs/bin/iwpriv rai0 set RTSThreshold=1
/userfs/bin/iwpriv rai0 set fc_lb=48
/userfs/bin/iwpriv rai0 set fc_hth=300
/userfs/bin/iwpriv rai0 set fc_lth=10
/userfs/bin/iwpriv rai0 set BeaconPeriod=1000
/userfs/bin/iwpriv rai0 mac 1300=111ff
/userfs/bin/iwpriv rai0 mac 1304=111ff
/userfs/bin/iwpriv rai0 mac 1308=111ff
/userfs/bin/iwpriv rai0 mac 130c=111ff
/userfs/bin/iwpriv rai0 mac 1030=ffffffff
/userfs/bin/iwpriv rai0 mac 1034=ffffffff
/userfs/bin/iwpriv rai0 mac 1038=ffffffff
/userfs/bin/iwpriv rai0 mac 103c=ffffffff
/userfs/bin/iwpriv rai0 set TxPower=10
kill -23 `pidof cfg_manager`