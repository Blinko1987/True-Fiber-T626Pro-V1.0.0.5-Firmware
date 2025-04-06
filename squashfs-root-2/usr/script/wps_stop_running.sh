#!/bin/sh

/userfs/bin/iwpriv ra0 set WscStop=1
/userfs/bin/iwpriv ra1 set WscStop=1 
/userfs/bin/iwpriv ra2 set WscStop=1
/userfs/bin/iwpriv ra3 set WscStop=1
/userfs/bin/iwpriv apcli0 set WscStop=1

/userfs/bin/iwpriv rai0 set WscStop=1
/userfs/bin/iwpriv rai1 set WscStop=1
/userfs/bin/iwpriv rai2 set WscStop=1
/userfs/bin/iwpriv rai3 set WscStop=1
/userfs/bin/iwpriv apclii0 set WscStop=1