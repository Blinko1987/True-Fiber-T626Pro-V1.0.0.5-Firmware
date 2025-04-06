#!/bin/sh
/userfs/bin/iwpriv ra0 set manual_txop=1
/userfs/bin/iwpriv ra0 mac 60130014=00a000a0
/userfs/bin/iwpriv ra0 mac 60130010=00a000a0
/userfs/bin/iwpriv ra0 set be_to_vo=0
DEFAULTSETON=`/userfs/bin/tcapi get WLan_Common WiFiEnhanceSet`
if [ "$DEFAULTSETON" = "1" ];then
	/userfs/bin/iwpriv ra0 mac 60130014=ffffffff
	/userfs/bin/iwpriv ra0 mac 60130010=ffffffff
fi
