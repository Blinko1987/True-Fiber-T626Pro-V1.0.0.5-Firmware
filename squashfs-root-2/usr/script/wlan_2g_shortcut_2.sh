killall -9 usb_auto_mount
killall -9 bandwidth
killall -9 tcwdog
killall -9 jvm_monitor
killall -9 smbd
killall -9 nmbd
killall -9 java
killall -9 mobile-manager 
killall -9 bundle_monitor
ifconfig rai0 down
/bin/echo 8 >/proc/irq/22/smp_affinity
/bin/echo 7 >/proc/irq/24/smp_affinity
/bin/echo 7 >/proc/irq/25/smp_affinity
/bin/echo 80000 > /proc/net/skbmgr_driver_max_skb
/bin/echo 70000 > /proc/net/skbmgr_limit
/bin/echo 70000 > /proc/net/skbmgr_4k_limit
/bin/echo 15000 > /proc/net/skbmgr_hot_list_len
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 600 600 600 600
/userfs/bin/iwpriv ra0 set protectset=7
/userfs/bin/iwpriv ra0 set pse_dbg=0
/userfs/bin/iwpriv ra0 set TxPower=0
/userfs/bin/iwpriv ra0 set veriwaveDetectNoShortcut=1
/userfs/bin/iwpriv ra0 set autoShortcutFlag=0
/bin/echo 0 0 2 > /proc/tc3162/lan_tx
/userfs/bin/iwpriv ra0 set ShortcutFlag=1
/userfs/bin/iwpriv ra0 set be_to_vo=1
/userfs/bin/iwpriv ra0 set flag_for_multiclient=1
/userfs/bin/iwpriv ra0 set TxBurst=0
/userfs/bin/iwpriv ra0 set HtRdg=0
/userfs/bin/iwpriv ra0 set ed_chk=0
/userfs/bin/iwpriv ra0 mac 60200618=d7083f0f
/userfs/bin/iwpriv ra0 set SCSEnable=0
/userfs/bin/iwpriv ra0 mac 60200500=7ff6666f
/userfs/bin/iwpriv ra0 mac 60201500=7ff6666f
/userfs/bin/iwpriv ra0 mac 6020050c=818181e3
/userfs/bin/iwpriv ra0 mac 6020150c=818181e3
/userfs/bin/iwpriv ra0 set MaxRxProcessCnt=1024
/userfs/bin/iwpriv ra0 set flushone_timeout=1000
/userfs/bin/iwpriv ra0 set flushall_timeout=1000
/userfs/bin/iwpriv ra0 set ForceShortGI=1
/userfs/bin/iwpriv ra0 set TxSwQLen=7000
/userfs/bin/iwpriv ra0 set flag_for_ixiatest=1
/userfs/bin/iwpriv ra0 set manual_txop=1
/userfs/bin/iwpriv ra0 mac 60130014=00a000a0
/userfs/bin/iwpriv ra0 mac 60130010=00a000a0
/userfs/bin/iwpriv ra0 mac 2169C=80783C82
/userfs/bin/iwpriv ra0 mac 60200620=8564263C
/userfs/bin/iwpriv ra0 mac 60200618=d7e80A10
/userfs/bin/iwpriv ra0 set fcont=1
/userfs/bin/iwpriv ra0 set ShortRetry=30
/userfs/bin/iwpriv ra0 set ShortcutQMax=40000
/userfs/bin/iwpriv ra0 set ShortcutMaxSkb=40000
/userfs/bin/iwpriv ra0 set ShortcutQSize=128
/userfs/bin/iwpriv ra0 set ShortCutV2Enhance=1
/userfs/bin/iwpriv ra0 set ShortcutQTime=30
/userfs/bin/iwpriv ra0 set ShortcutDeqCnt=512
kill -9 `pidof cfg_recover`
/userfs/bin/cfg_recover &
