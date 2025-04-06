#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    . $PROFILE_CFG
fi

config_switch()
{
#/userfs/bin/ethphxcmd arl aging 0 5
/userfs/bin/ethphxcmd gsww 210c 10
/userfs/bin/ethphxcmd gsww 220c 10
/userfs/bin/ethphxcmd gsww 230c 10
/userfs/bin/ethphxcmd gsww 240c 10
/userfs/bin/ethphxcmd gsww 260c 10
}

start_controller()
{
config_switch
if [ "$TCSUPPORT_HGU_TELMEX" = "" ] ;then
brctl stp br0 on
fi
brctl setbridgeprio br0 0
}

start_agent()
{
config_switch
if [ "$TCSUPPORT_HGU_TELMEX" = "" ] ;then
brctl stp br0 on
fi
brctl setbridgeprio br0 32768
brctl setpathcost br0 apcli0 402
brctl setpathcost br0 apclii0 401
}

if [ $1 -eq 1 ]
then
start_agent
else
start_controller
fi