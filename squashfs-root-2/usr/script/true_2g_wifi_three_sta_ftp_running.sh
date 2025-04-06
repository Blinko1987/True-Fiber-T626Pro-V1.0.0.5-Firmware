#!/bin/sh

#1.close re-cal
/userfs/bin/iwpriv ra1 set ThermalDbgCmd=1:0
/userfs/bin/iwpriv rai1 set ThermalDbgCmd=1:0

#2.close Mesh
/bin/echo 1 >/tmp/upgrading_flag
/usr/bin/killall -9 wapp
/usr/bin/killall -9 p1905_managerd
/usr/bin/killall -9 mapd
/usr/bin/killall -9 bs20

#3.close meshsync_send¡¢meshsync_recv
/usr/bin/killall -9 meshsync_send
/usr/bin/killall -9 meshsync_recv
/usr/bin/killall -9 alf_iot_manage

#4.close UpdateLanList
/usr/bin/killall -9 UpdateLanList

#===============================THREE STA===============================
#5.WMM
/userfs/bin/iwpriv ra1 set TxBurst=0
/userfs/bin/iwpriv ra1 mac 820E40C4=0000000
/userfs/bin/iwpriv ra1 set APAifsn=2:7:1:1
/userfs/bin/iwpriv ra1 set APCwmin=4:4:3:2
/userfs/bin/iwpriv ra1 set APCwmax=8:10:4:3
/userfs/bin/iwpriv ra1 set BSSAifsn=1:7:2:2
/userfs/bin/iwpriv ra1 set BSSCwmin=2:4:3:2
/userfs/bin/iwpriv ra1 set BSSCwmax=3:10:4:3

#6.RTS£¬retry set 15
/userfs/bin/iwpriv ra1 mac 820E2068=040017c0

#7.close mimo,ofdma,scs,tcapi save tcapi commit wlan
#/userfs/bin/tcapi set wlan_common SREnable 0
#/userfs/bin/tcapi set wlan_common MuOfdmaDlEnable 0
#/userfs/bin/tcapi set wlan_common MuMimoDlEnable 0
#/userfs/bin/tcapi save
/userfs/bin/iwpriv ra1 set muru_dl_enable=0
/userfs/bin/iwpriv ra1 set mu_dl_enable=0
/userfs/bin/iwpriv ra1 set SCSEnable=0

#8.mac limit
#/userfs/bin/blapi_cmd traffic set_ratelimit_mode 0
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 F83441A859d5 10000 10000
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 AC2b6eb7bf60 10000 10000
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 3cf8620b41b3 10000 10000
#===============================THREE STA===============================

