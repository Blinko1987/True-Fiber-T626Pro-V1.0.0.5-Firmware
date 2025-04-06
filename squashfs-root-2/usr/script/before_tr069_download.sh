WLAN_MODULE_RT5392=/lib/modules/rt5392ap.ko
WLAN_MODULE_RT5390=/lib/modules/rt5390ap.ko
WLAN_MODULE_RT3390=/lib/modules/rt3390ap.ko
WLAN_MODULE_RT3090=/lib/modules/rt3090ap.ko
WLAN_MODULE_RT2561=/lib/modules/rt61ap.ko

#/userfs/bin/iwpriv ra1 set True_ACSCheckTime=3600
/userfs/bin/iwpriv ra0 set DisConnectAllSta=1
/userfs/bin/iwpriv ra1 set DisConnectAllSta=1
/sbin/ifconfig ra0 down
/sbin/ifconfig ra1 down
/sbin/ifconfig ra2 down
/sbin/ifconfig ra3 down
#/userfs/bin/iwpriv rai1 set True_ACSCheckTime=3600
/userfs/bin/iwpriv rai0 set DisConnectAllSta=1
/userfs/bin/iwpriv rai1 set DisConnectAllSta=1
/sbin/ifconfig rai0 down
/sbin/ifconfig rai1 down
/sbin/ifconfig rai2 down
/sbin/ifconfig rai3 down

if [ -f $WLAN_MODULE_RT5392 ] ; then
        /sbin/rmmod rt5392ap
fi

if [ -f $WLAN_MODULE_RT5390 ] ; then
	/sbin/rmmod rt5390ap
fi

if [ -f $WLAN_MODULE_RT3390 ] ; then
	/sbin/rmmod rt3390ap
fi

if [ -f $WLAN_MODULE_RT3090 ] ; then
	/sbin/rmmod rt3090ap
fi

if [ -f $WLAN_MODULE_RT2561 ] ; then
	/sbin/rmmod rt61ap
fi

if [ $# = 1 ] ; then
if [ $1 != "ROM" ] ; then
	/usr/bin/killall syslogd
fi
else
	/usr/bin/killall syslogd
fi
/bin/echo "upgrading now..."  >/tmp/upgrading_flag
/usr/bin/killall -9 syslogd    2>/dev/null
/usr/bin/killall -9 klogd      2>/dev/null
/usr/bin/killall -9 bftpd      2>/dev/null
/usr/bin/killall -9 utelnetd   2>/dev/null
/usr/bin/killall -9 udhcpd     2>/dev/null
/usr/bin/killall -9 radvd      2>/dev/null
/usr/bin/killall -9 arp        2>/dev/null
/usr/bin/killall -9 dhcp6s     2>/dev/null
/usr/bin/killall -9 snmpd      2>/dev/null
/usr/bin/killall -9 upnpd      2>/dev/null
/usr/bin/killall -9 igmpproxy  2>/dev/null
/usr/bin/killall -9 dhcp6s     2>/dev/null
/usr/bin/killall -9 sipclient  2>/dev/null
/usr/bin/killall -9 smbd       2>/dev/null
/usr/bin/killall -9 nmbd       2>/dev/null
/usr/bin/killall -9 igmpproxy  2>/dev/null
/usr/bin/killall -9 wapp       2>/dev/null
/usr/bin/killall -9 bs20       2>/dev/null
/usr/bin/killall -9 p1905_managerd 2>/dev/null
/usr/bin/killall -9 mapd       2>/dev/null

echo "3" > /proc/sys/vm/drop_caches
