#!/bin/sh
BOOT_UP_DONE_CHECK_FILE=/tmp/wlan_init_protection
idx=0
BOOT_UP_STATUS=0
CHECK_TIMES=30

#This script is used to avoid collision if usr click reboot while wlan is initializing.
#Such this situation may cause wifi crash because reboot closes wlan interface.
#reboot will be delayed several seconds until wlan finishes initializing.

if [ -f $BOOT_UP_DONE_CHECK_FILE ] ; then

	while [ "$idx" -lt "$CHECK_TIMES" ];do
		sleep 1

		idx=`expr $idx + 1`
		BOOT_UP_STATUS=`cat $BOOT_UP_DONE_CHECK_FILE`

		if [ "$BOOT_UP_STATUS" = "0" ] ; then

			break
		fi
	done
fi
