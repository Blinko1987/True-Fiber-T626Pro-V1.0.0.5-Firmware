#!/bin/sh

echo "##########,disable_force_strng=0 START"  > /dev/console
/userfs/bin/mapd_cli /tmp/mapd_ctrl set disable_force_strng 0
/userfs/bin/mapd_cli /tmp/mapd_ctrl set disable_force_strng_11v_cli 0

#/userfs/bin/mapd_cli /tmp/mapd_ctrl set discern_manufacturer 1
/userfs/bin/mapd_cli /tmp/mapd_ctrl set reset_force_csbc_steer_complete 1

/userfs/bin/mapd_cli /tmp/mapd_ctrl set MaxSteerRetryTime 10
/userfs/bin/mapd_cli /tmp/mapd_ctrl set RSSISteeringEdge_DG 27
/userfs/bin/mapd_cli /tmp/mapd_ctrl set RSSISteeringEdge_UG 25
/userfs/bin/mapd_cli /tmp/mapd_ctrl set skip_btm_idle_active 1

/userfs/bin/mapd_cli /tmp/mapd_ctrl set BTMSteeringProhibitTime 10
/userfs/bin/mapd_cli /tmp/mapd_ctrl set BTMUnfriendlyTime 45
/userfs/bin/mapd_cli /tmp/mapd_ctrl set SteeringProhibitTime 10
/userfs/bin/mapd_cli /tmp/mapd_ctrl set SteeringUnfriendlyTime 45
/userfs/bin/mapd_cli /tmp/mapd_ctrl set update_2g_ch_without_probe_req 1

/userfs/bin/mapd_cli /tmp/mapd_ctrl set unfriendly_time_consistent 1
/userfs/bin/mapd_cli /tmp/mapd_ctrl set ignore_steer_window 1
/userfs/bin/mapd_cli /tmp/mapd_ctrl set skip_own_bssid_ap_steer 1

/userfs/bin/iwpriv ra1 set True_chan_12_13=1
/userfs/bin/iwpriv ra1 set SCSLevel=1
echo "##########,disable_force_strng=0 END"  > /dev/console