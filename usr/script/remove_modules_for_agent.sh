#!/bin/sh

echo "##########,remove_modules_for_agent START"  > /dev/console
/sbin/ifconfig pon down
/sbin/ifconfig omci down
/sbin/ifconfig oam down

#/usr/bin/killall -9 ponmgr_v2
/usr/bin/killall -9 omci

/sbin/rmmod  /lib/modules/loopdetect.ko
#/sbin/rmmod  /lib/modules/speedtest.ko
#/sbin/rmmod  /lib/modules/xponmap.ko
#/sbin/rmmod  /lib/modules/xpon_igmp.ko
#/sbin/rmmod  /lib/modules/ponmacfilter.ko
#/sbin/rmmod  /lib/modules/ponvlan.ko
echo "##########,remove_modules_for_agent END"  > /dev/console