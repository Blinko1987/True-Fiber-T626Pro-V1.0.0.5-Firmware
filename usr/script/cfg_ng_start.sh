#!/bin/sh

. /usr/script/lib_modules

PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    . $PROFILE_CFG
fi

modules_set_cpubind_for_cfg_ng
aff=$CFG_NG_AFF

#add by geraldxue at 2023.08.12 for svchost gdb debug, disable default
#ulimit -c unlimited
#echo 1 > /proc/sys/kernel/core_uses_pid
#echo "/tmp/core-%e-%p-%t" > /proc/sys/kernel/core_pattern

taskset $aff /userfs/bin/ubusd & 
echo 1 > /tmp/use_cfg_ng
sleep 1

i=0;

echo "/lib/libcfg_clisvc.so:svc_cfg_main:111" > /etc/cfg.svc
taskset $aff /userfs/bin/svchost -c /etc/cfg.svc &
echo $! > /var/run/cfg_svc.pid
i=`expr $i + 1`

uptime=300;
while [ ! -f "/tmp/cfg_load" ] && [ $uptime -gt 0 ]; do
echo "/tmp/cfg_load is not exist,left time $uptime"; 
sleep 1;
uptime=`expr $uptime - 1`;
done;

if [ ! -f "/proc/tc3162/wan_2_5" ] ;then
if [ "$TCSUPPORT_CT_PON" != "" ] ; then
if [ "$TCSUPPORT_NP" = "" ] ; then
echo "/lib/libpon_svc.so:svc_pon_main:111" > /etc/pon.svc
taskset $aff /userfs/bin/svchost -c /etc/pon.svc &
echo $! > /var/run/pon_svc.pid
i=`expr $i + 1`
fi
fi
fi

echo "/lib/libwan_svc.so:svc_wan_main:111" > /etc/wan.svc
taskset $aff /userfs/bin/svchost -c /etc/wan.svc &
echo $! > /var/run/wan_svc.pid
i=`expr $i + 1`

if [ "$TCSUPPORT_WLAN" != "" ] ;then
echo "/lib/libwlan_svc.so:svc_wlan_main:111" > /etc/wlan.svc
taskset $aff /userfs/bin/svchost -c /etc/wlan.svc &
echo $! > /var/run/wlan_svc.pid
i=`expr $i + 1`
fi

echo "/lib/libwan_related_svc.so:svc_wan_related_main:111" > /etc/wan_related.svc
taskset $aff /userfs/bin/svchost -c /etc/wan_related.svc &
echo $! > /var/run/wan_related_svc.pid
i=`expr $i + 1`

echo "/lib/libother_svc.so:svc_other_main:111" > /etc/other.svc
taskset $aff /userfs/bin/svchost -c /etc/other.svc &
echo $! > /var/run/other_svc.pid
i=`expr $i + 1`

echo "/lib/libcentral_ctrl_svc.so:svc_central_ctrl_main:111" > /etc/central_ctrl.svc
taskset $aff /userfs/bin/svchost -c /etc/central_ctrl.svc &
echo $! > /var/run/central_ctrl_svc.pid
i=`expr $i + 1`

if [ "$TCSUPPORT_VOIP" != "" ] ;then
echo "/lib/libvoip_svc.so:svc_voip_main:111" > /etc/voip.svc
taskset $aff /userfs/bin/svchost -c /etc/voip.svc &
echo $! > /var/run/voip_svc.pid
i=`expr $i + 1`
fi

if [ "$TCSUPPORT_ECNT_MAP" != "" ] ;then
echo "/lib/libmesh_svc.so:svc_mesh_main:111" > /etc/mesh.svc
taskset $aff /userfs/bin/svchost -c /etc/mesh.svc &
echo $! > /var/run/mesh.pid
i=`expr $i + 1`
fi

echo $i > /tmp/svc_num
