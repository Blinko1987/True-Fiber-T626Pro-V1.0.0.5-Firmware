/sbin/ifconfig rai0 up
/sbin/ifconfig apclii0 up
/sbin/ifconfig apcli0 up
kill -25 `cat /var/run/wlan_svc.pid`
kill -25 `cat /var/run/wan_related_svc.pid`
kill -25 `cat /var/run/other_svc.pid`
kill -25 `cat /var/run/central_ctrl_svc.pid`
echo 0 5 0 0 450 0 0 0 0 > /proc/tc3162/ixia_txrx
/userfs/bin/alink-mgr &
txpowerVal=`/userfs/bin/tcapi get WLan_Common TxPowerLevel`
echo $txpowerVal > /tmp/txpowerval
if [ "$txpowerVal" = "1" ]; then
	/userfs/bin/iwpriv ra0 set TxPower=100
else
if [ "$txpowerVal" = "2" ]; then
	/userfs/bin/iwpriv ra0 set TxPower=80
else
if [ "$txpowerVal" = "3" ]; then
	/userfs/bin/iwpriv ra0 set TxPower=60
else
if [ "$txpowerVal" = "4" ]; then
	/userfs/bin/iwpriv ra0 set TxPower=40
else
	/userfs/bin/iwpriv ra0 set TxPower=20
fi
fi
fi
fi

