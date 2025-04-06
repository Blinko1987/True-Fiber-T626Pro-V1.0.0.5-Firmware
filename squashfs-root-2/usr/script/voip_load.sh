#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

if [ "$TCSUPPORT_VOIP" != "" ] ;then
echo "MTK DSP support"
COUNTRY=`/userfs/bin/tcapi get VoIPAdvanced_Common VoIPRegion`
echo 3 > /proc/sys/vm/drop_caches

if [ -f /userfs/bin/voip_loader ] ;then
/userfs/bin/voip_loader
fi

if [ "$VOIP_LOADER_SUCCESS" == "yes" ] ;then
insmod /lib/modules/sys_mod.ko
insmod /lib/modules/DSPCore.ko
insmod /lib/modules/pcm1.ko
insmod /lib/modules/lec.ko
insmod /lib/modules/spi.ko
insmod /lib/modules/fxs3.ko  
insmod /lib/modules/slic3.ko type=ZSI slic="le9642" 
insmod /lib/modules/ksocket.ko
insmod /lib/modules/ortp.ko
insmod /lib/modules/acodec_x.ko
insmod /lib/modules/foip.ko
insmod /lib/modules/ovdsp.ko
fi #end of VOIP_LOADER_SUCCESS

sleep 1

. /usr/script/lib_voip
taskset -p 0x8 `pidof vtspr`

echo 8 >/proc/irq/34/smp_affinity
taskset -p 0x8 `pidof ORTP_TASK`
taskset -p 0x8 `pidof fxs_task`
taskset -p 0x8 `pidof slicint_task`
taskset -p 0x8 `pidof DSPProc`
taskset -p 0x8 `pidof DspDlTask`
taskset -p 0x8 `pidof DspUlTask`
taskset -p 0x8 `pidof cid_task`
taskset -p 0x8 `pidof pcmreinit_task`

SLICTYPE = `cat proc/fxs/slicType`
if ["$SLICTYPE" != "2"]; then
echo "1" >/proc/DSPCore/pcmreset
fi

FXSNUM=`cat /proc/fxs/fxsNum`
FXONUM=`cat /proc/fxs/fxoNum`
sleep 2
INFCNUM=`expr $FXSNUM + $FXONUM`
/userfs/bin/tcapi set VoIPSysParam_Common SC_SYS_CFG_MAX_LINE $INFCNUM
/userfs/bin/tcapi set VoIPSysParam_Common SC_SYS_CFG_MAX_ACCT $INFCNUM
STRMNUM=`expr $INFCNUM \* 2`
/userfs/bin/tcapi set VoIPSysParam_Common SC_SYS_CFG_MAX_CALL $STRMNUM
echo "[VOIP] Usage: $INFCNUM acct $STRMNUM"
/userfs/bin/tcapi set VoIPSysParam_Common SlicFXSNum "$FXSNUM"
/userfs/bin/tcapi set VoIPSysParam_Common SlicFXONum "$FXONUM"
/userfs/bin/tcapi set VoIPBasic_Common VoIPLineNumber "$FXSNUM"
if [ $FXSNUM -gt 1 ]; then
/userfs/bin/tcapi set VoIPBasic_Common VoIPLine2Enable "Yes"
else
/userfs/bin/tcapi set VoIPBasic_Common VoIPLine2Enable "No"
fi
#/userfs/bin/sipclient &
if [ "$TCSUPPORT_ECN_SIP" != "" ] || [ "$TCSUPPORT_ECN_MEGACO" != "" ] ;then
#/userfs/bin/tcapi set System_Entry start_up 2
#/userfs/bin/tcapi commit System_Entry
#/userfs/bin/tcapi set System_Entry start_up 0

if [ "$TCSUPPORT_ECN_SIP" != "" ] && [ "$TCSUPPORT_ECN_MEGACO" != "" ] ;then
SIPPROTOCOL=`/userfs/bin/tcapi get VoIPBasic_Common SIPProtocol`
usr/bin/killall -9 mgapp
usr/bin/killall -9 tcVoIPApiServer
usr/bin/killall -9 sipclient

if [ "$SIPPROTOCOL" != "H.248" ] ;then
if [ "$reset_flag" != "1" ] ;then
/userfs/bin/sipclient &
fi
else
/userfs/bin/tcVoIPApiServer &
/userfs/bin/mgapp -id 0 &
fi
else
if [ "$TCSUPPORT_ECN_SIP" != "" ];then
if [ "$reset_flag" != "1" ] ;then
/userfs/bin/sipclient &
fi
else
/userfs/bin/tcVoIPApiServer &
/userfs/bin/mgapp -id 0 &
fi
fi
else
/userfs/bin/sipapp &
fi
#set default value to auto gain control,default disable
/bin/echo "0 15 -12 0" > /proc/fxs/autogain
fi
pidof sipclient > /var/run/voip_sip.pid

