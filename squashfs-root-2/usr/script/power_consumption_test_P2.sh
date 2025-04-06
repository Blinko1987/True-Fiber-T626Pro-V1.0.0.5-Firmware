#!/bin/sh
tce emiiw 12 1f 271 7ca5	
tce emiiw 12 1f 269 111f	
tce miiw 9 23 b0	
tce emiiw 9 1e 3e 0	
tce miiw 10 23 b0	
tce emiiw 10 1e 3e 0	
tce miiw 11 23 b0	
tce emiiw 11 1e 3e 0	
tce miiw 12 23 b0	
tce emiiw 12 1e 3e 0
sys memwl bfa80a04 26115132	
sys memwl bfa80304 0	
sys memwl bfac0a04 4f114a32	
sys memwl bfac0b04 4	
sys memwl bfaf2204 88014000	
sys memwl bfaf2040 421003e0
sys memwl bfb90420 a0	
sys memwl bfb90430 a0	
sys memwl bfb90440 a0		
tce miiw 9 0 800	
tce miiw 10 0 800	
tce miiw 11 0 800	
sys wlanled on
sys wlan11acled on
killall -9 svchost
#ifconfig ra0 down
#ifconfig  apcli0 down
#sys memwl bfaf2000 7f7f0010
#ifconfig rai0 down
#ifconfig  apclii0 down
#sys memwl bfac030c 80000000