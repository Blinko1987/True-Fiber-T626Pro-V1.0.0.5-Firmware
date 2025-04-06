#!/bin/sh

. /usr/script/lib_modules

PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    . $PROFILE_CFG
fi

modules_set_cpubind_for_restore_cpu
aff=$RESTORE_CPU_AFF

taskset -p $aff `pidof ubusd`

taskset -p $aff `cat /var/run/cfg_svc.pid`

if [ "$TCSUPPORT_CT_PON" != "" ] ; then
if [ "$TCSUPPORT_NP" = "" ] ; then
taskset -p $aff `cat /var/run/pon_svc.pid`
fi
fi

taskset -p $aff `cat /var/run/wan_svc.pid`

taskset -p $aff `cat /var/run/wlan_svc.pid`

taskset -p $aff `cat /var/run/wan_related_svc.pid`

taskset -p $aff `cat /var/run/other_svc.pid`

taskset -p $aff `cat /var/run/central_ctrl_svc.pid`

if [ "$TCSUPPORT_VOIP" != "" ] ;then
taskset -p $aff `cat /var/run/voip_svc.pid`
fi

if [ "$TCSUPPORT_ECNT_MAP" != "" ] ;then
taskset -p $aff `cat /var/run/mesh.pid`
fi
