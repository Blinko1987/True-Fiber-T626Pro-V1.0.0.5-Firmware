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

#5.mac limit
#/userfs/bin/blapi_cmd traffic set_ratelimit_mode 0
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 F83441A55B7C 110000 110000
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 ACED5CE0F470 110000 110000
#/userfs/bin/blapi_cmd traffic set_dev_ratelimit 1 ACED5CD39799 110000 110000