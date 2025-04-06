#!/bin/sh

#1.set txpower low
/userfs/bin/iwpriv rai1 set PercentageCtrl=1
/userfs/bin/iwpriv rai1 set PowerDropCtrl=50

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

#6.mac limit
#/userfs/bin/blapi_cmd traffic set_ratelimit_mode 0
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 F83441A55B7C 110000 110000
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 ACED5CE0F470 110000 110000
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 ACED5CD39799 110000 110000