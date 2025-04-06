#!/bin/sh

echo "##########,disable_force_strng=1 START"  > /dev/console
/userfs/bin/mapd_cli /tmp/mapd_ctrl set disable_force_strng 1
/userfs/bin/mapd_cli /tmp/mapd_ctrl set disable_force_strng_11v_cli 1

/userfs/bin/mapd_cli /tmp/mapd_ctrl set discern_manufacturer 0
/userfs/bin/mapd_cli /tmp/mapd_ctrl set reset_force_csbc_steer_complete 0

/userfs/bin/mapd_cli /tmp/mapd_ctrl set MaxSteerRetryTime 30
/userfs/bin/mapd_cli /tmp/mapd_ctrl set RSSISteeringEdge_DG 27
/userfs/bin/mapd_cli /tmp/mapd_ctrl set RSSISteeringEdge_UG 33
/userfs/bin/mapd_cli /tmp/mapd_ctrl set skip_btm_idle_active 0

/userfs/bin/mapd_cli /tmp/mapd_ctrl set BTMSteeringProhibitTime 30
/userfs/bin/mapd_cli /tmp/mapd_ctrl set BTMUnfriendlyTime 60
/userfs/bin/mapd_cli /tmp/mapd_ctrl set SteeringProhibitTime 45
/userfs/bin/mapd_cli /tmp/mapd_ctrl set SteeringUnfriendlyTime 60
/userfs/bin/mapd_cli /tmp/mapd_ctrl set update_2g_ch_without_probe_req 1

/userfs/bin/mapd_cli /tmp/mapd_ctrl set unfriendly_time_consistent 0
/userfs/bin/mapd_cli /tmp/mapd_ctrl set ignore_steer_window 1
/userfs/bin/mapd_cli /tmp/mapd_ctrl set skip_own_bssid_ap_steer 1

echo "##########,disable_force_strng=1 END"  > /dev/console