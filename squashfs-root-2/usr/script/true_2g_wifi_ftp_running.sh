#!/bin/sh

#1.set txpower low
/userfs/bin/iwpriv ra1 set PercentageCtrl=1
/userfs/bin/iwpriv ra1 set PowerDropCtrl=50

#2.close re-cal
/userfs/bin/iwpriv ra1 set ThermalDbgCmd=1:0
/userfs/bin/iwpriv rai1 set ThermalDbgCmd=1:0

#3.close Mesh
/bin/echo 1 >/tmp/upgrading_flag
/usr/bin/killall -9 wapp
/usr/bin/killall -9 p1905_managerd
/usr/bin/killall -9 mapd
/usr/bin/killall -9 bs20

#4.close meshsync_send¡¢meshsync_recv
/usr/bin/killall -9 meshsync_send
/usr/bin/killall -9 meshsync_recv
/usr/bin/killall -9 alf_iot_manage

#5.close UpdateLanList
/usr/bin/killall -9 UpdateLanList