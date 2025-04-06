#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

#wlan init protection lock, used by check_reboot_need_delay.sh
echo 1 > /tmp/wlan_init_protection
if [ "$TCSUPPORT_NPU_WIFI_OFFLOAD" != "" ] ;then 
echo `/userfs/bin/tcapi get WLan11ac_Common NpuOffloadEn` > /proc/npu_offload_5G
fi

if [ "$TCSUPPORT_WLAN" != "" ] && [ -f "/proc/tc3162/sys_has_wifi" ] ;then
echo "TCSUPPORT_WLAN"
if [ "$TCSUPPORT_WLAN_RT2561" != "" ] ;then
echo "TCSUPPORT_WLAN_RT2561"
insmod /lib/modules/rt61ap.ko
fi
if [ "$TCSUPPORT_WLAN_RT3390" != "" ] ;then
echo "TCSUPPORT_WLAN_RT3390"
insmod /lib/modules/rt3390ap.ko
fi
if [ "$TCSUPPORT_WLAN_RT5392" != "" ] ;then
echo "TCSUPPORT_WLAN_RT5392"
insmod /lib/modules/rt5390ap.ko
fi
if [ "$TCSUPPORT_WLAN_RT5390" != "" ] ;then
echo "TCSUPPORT_WLAN_RT5390"
insmod /lib/modules/rt5390ap.ko
fi
if [ "$TCSUPPORT_WLAN_RT5390HL" != "" ] ;then
echo "TCSUPPORT_WLAN_RT5390HL"
insmod /lib/modules/rt5390ap.ko
fi
if [ "$TCSUPPORT_WLAN_MT7601E" != "" ] ;then
echo "TCSUPPORT_WLAN_MT7601E"
insmod /lib/modules/mt7601Eap.ko
fi
if [ "$TCSUPPORT_WLAN_RT3090" != "" ] ;then
echo "TCSUPPORT_WLAN_RT3090"
insmod /lib/modules/rt3090ap.ko
fi
if [ "$TCSUPPORT_DUAL_WLAN_RT5592" != "" ] ;then
echo "TCSUPPORT_DUAL_WLAN_RT5592"
insmod /lib/modules/rt5592ap.ko
fi
if [ "$TCSUPPORT_DUAL_WLAN_RT3593" != "" ] ;then
echo "TCSUPPORT_DUAL_WLAN_RT3593"
insmod /lib/modules/rt3593ap.ko
fi
if [ "$TCSUPPORT_WLAN_MULTIDRIVER" != "" ] ;then
echo "TCSUPPORT_WLAN_MULTIDRIVER"
if [ "$TCSUPPORT_CT_WLAN_WAPI" != "" ] ;then
insmod /lib/modules/wapi_module.ko
fi
insmod /lib/modules/rt3593ap.ko
fi
if [ "$TCSUPPORT_DUAL_WLAN_MT7610E" != "" ] ;then
echo "TCSUPPORT_DUAL_WLAN_MT7610E"
insmod /lib/modules/mt7610e_ap.ko
fi
if [ "$TCSUPPORT_DUAL_WLAN_MT7612E" != "" ] ;then
echo "TCSUPPORT_DUAL_WLAN_MT7612E"
insmod /lib/modules/mt7662e_ap.ko
fi
if [ "$TCSUPPORT_DUAL_WLAN_MT7613E" != "" ] ;then
echo "TCSUPPORT_DUAL_WLAN_MT7613E"
insmod /lib/modules/mt7663_ap.ko
fi
if [ "$TCSUPPORT_WLAN_MT7615_11N" != "" ] || [ "$TCSUPPORT_DUAL_WLAN_MT7615E" != "" ]|| [ "$TCSUPPORT_WLAN_MT7615D" != "" ];then
echo "TCSUPPORT_DUAL_WLAN_MT7615E"
insmod /lib/modules/mt7615_ap.ko
fi
if [ "$TCSUPPORT_WLAN_MT7915N" != "" ] || [ "$TCSUPPORT_DUAL_WLAN_MT7915E" != "" ]|| [ "$TCSUPPORT_WLAN_MT7915D" != "" ];then
echo "TCSUPPORT_DUAL_WLAN_MT7915E"
insmod /lib/modules/mt7915_ap.ko
fi
if [ "$TCSUPPORT_WLAN_MT7916N" != "" ] || [ "$TCSUPPORT_DUAL_WLAN_MT7916E" != "" ]|| [ "$TCSUPPORT_WLAN_MT7916D" != "" ];then
echo "TCSUPPORT_DUAL_WLAN_MT7916E"
insmod /lib/modules/mt7916_ap.ko
fi
if [ "$TCSUPPORT_WLAN_MT7592" != "" ] ;then
echo "TCSUPPORT_WLAN_MT7592"
insmod /lib/modules/mt7603eap.ko
fi
if [ "$TCSUPPORT_WLAN_MT7615_TXOFFLOAD" != "" ] ;then
echo "TCSUPPORT_WLAN_MT7615_TXOFFLOAD"
insmod /lib/modules/mt_whnat.ko
fi
if [ "$TCSUPPORT_WLAN_MT7915_TXOFFLOAD" != "" ] ;then
echo "TCSUPPORT_WLAN_MT7915_TXOFFLOAD"
insmod /lib/modules/mt_whnat.ko
fi
if [ "$TCSUPPORT_WLAN_MT7916_TXOFFLOAD" != "" ] ;then
echo "TCSUPPORT_WLAN_MT7916_TXOFFLOAD"
insmod /lib/modules/mt_whnat.ko
fi
if [ "TCSUPPORT_MAP_FILTER" != "" ] ;then
echo "TCSUPPORT_MAP_FILTER"
insmod /lib/modules/mapfilter.ko
fi
fi

if [ "$TCSUPPORT_NPU_WIFI_OFFLOAD" != "" ] ;then 
echo `/userfs/bin/tcapi get WLan11ac_Common NpuOffloadEn` > /proc/npu_offload_5G
fi

if [ "$TCSUPPORT_WLAN" != "" ] ;then
echo "TCSUPPORT_WLAN: ifconfig"
isAPON=0
if [ "$TCSUPPORT_WLAN_MT7615D" != "" ] ;then
ssid0=0
ssid1=0
ssid2=0
ssid3=0
i=0
CONFFILE=/etc/Wireless/WLAN_APOn_AC
if [ -f $CONFFILE ] ;then
	chmod 777 $CONFFILE
	. $CONFFILE
	if [ "$TCSUPPORT_WLAN_PERSSID_SWITCH" != "" ] ;then
		case "$APOn" in
			"1" )
				isAPON=1
				ifconfig rai0 0.0.0.0 up
				while [ "$i" -lt "$Bssid_num" ];do
				 	case "$i" in
				 	"0" )
						if [ "$ssid0" = "1" ] ;then 
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						else
							ifconfig rai0 0.0.0.0 down
						fi
						;;
					"1" )
						if [ "$ssid1" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"2" )
						if [ "$ssid2" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"3" )
						if [ "$ssid3" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
				 	"4" )
						if [ "$ssid4" = "1" ] ;then 
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"5" )
						if [ "$ssid5" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"6" )
						if [ "$ssid6" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"7" )
						if [ "$ssid7" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					esac
					i=`expr $i + 1`
					done
				;;
			"0" )
				while [ "$i" -lt "$Bssid_num" ];do
					if [ "$i" = "0" ] ;then
						ifconfig rai$i 0.0.0.0 up
						brctl addif br0 rai$i
						ifconfig rai$i 0.0.0.0 down
					fi
					i=`expr $i + 1`
				done
				echo "@@@5G@@@,Radio is off!!!!!!!!"
				;;
		esac
	else
		while [ "$i" -lt "$Bssid_num" ];do
			case "$APOn" in
				"1" )
					isAPON=1
					ifconfig rai$i 0.0.0.0 up
					brctl addif br0 rai$i
					;;
				"0" )	
					ifconfig rai$i 0.0.0.0 up
					brctl addif br0 rai$i
					ifconfig rai$i 0.0.0.0 down
					;;
			esac
		i=`expr $i + 1`
		done
	fi
	
	if [ "$TCSUPPORT_WLAN_WDS" != "" ] ;then
		echo "TCSUPPORT_WLAN_WDS"
		if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
					ifconfig wdsi0 0.0.0.0 up
					brctl addif br0 wdsi0
					ifconfig wdsi1 0.0.0.0 up
					brctl addif br0 wdsi1
					ifconfig wdsi2 0.0.0.0 up
					brctl addif br0 wdsi2
					ifconfig wdsi3 0.0.0.0 up
					brctl addif br0 wdsi3
				;;
			"0" )
				;;
		esac
	fi
fi
i=0
while [ "$i" -lt "$Bssid_num" ];do
	unset ssid$i
	i=`expr $i + 1`
done
fi
i=0
CONFFILE=/etc/Wireless/WLAN_APOn
if [ -f $CONFFILE ] ;then
	chmod 777 $CONFFILE
	. $CONFFILE
	if [ "$TCSUPPORT_WLAN_PERSSID_SWITCH" != "" ] ;then
		case "$APOn" in
			"1" )
				isAPON=1
				ifconfig ra0 0.0.0.0 up
				while [ "$i" -lt "$Bssid_num" ];do
				 	case "$i" in
				 	"0" )
						if [ "$ssid0" = "1" ] ;then 
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						else
							ifconfig ra0 0.0.0.0 down
						fi
						;;
					"1" )
						if [ "$ssid1" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"2" )
						if [ "$ssid2" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"3" )
						if [ "$ssid3" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
				 	"4" )
						if [ "$ssid4" = "1" ] ;then 
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"5" )
						if [ "$ssid5" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"6" )
						if [ "$ssid6" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"7" )
						if [ "$ssid7" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					esac
					i=`expr $i + 1`
					done
				;;
			"0" )
				while [ "$i" -lt "$Bssid_num" ];do
					if [ "$i" = "0" ] ;then
						ifconfig ra$i 0.0.0.0 up
						brctl addif br0 ra$i
						ifconfig ra$i 0.0.0.0 down
					fi
					i=`expr $i + 1`
				done
				echo "@@@2G@@@,Radio is off!!!!!!!!"
				;;
		esac
	else
		while [ "$i" -lt "$Bssid_num" ];do
			case "$APOn" in
				"1" )
					isAPON=1
					ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
					;;
				"0" )	
					ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
					ifconfig ra$i 0.0.0.0 down
					;;
			esac	
		i=`expr $i + 1`
		done
	fi
	if [ "$TCSUPPORT_MAX_PACKET_2000" != "" ] ;then
		ifconfig ra0 mtu 2000
	fi

	if [ "$TCSUPPORT_WLAN_WDS" != "" ] ;then
		echo "TCSUPPORT_WLAN_WDS"
		if [ "$TCSUPPORT_C1_OBM" != "" ] ;then
			if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
				if [ "$Wds0ON" = "1" ] ;then
					ifconfig wds0 0.0.0.0 up
					brctl addif br0 wds0
				fi
				if [ "$Wds1ON" = "1" ] ;then
					ifconfig wds1 0.0.0.0 up
					brctl addif br0 wds1
				fi
				if [ "$Wds2ON" = "1" ] ;then
					ifconfig wds2 0.0.0.0 up
					brctl addif br0 wds2
				fi
				if [ "$Wds3ON" = "1" ] ;then
					ifconfig wds3 0.0.0.0 up
					brctl addif br0 wds3
				fi
				;;
			"0" )
				;;
		esac
			fi
		else
			if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
					ifconfig wds0 0.0.0.0 up
					brctl addif br0 wds0
					ifconfig wds1 0.0.0.0 up
					brctl addif br0 wds1
					ifconfig wds2 0.0.0.0 up
					brctl addif br0 wds2
					ifconfig wds3 0.0.0.0 up
					brctl addif br0 wds3
				;;
			"0" )
				;;
		esac
		fi
	fi
	fi
	if [ "$TCSUPPORT_FON" != "" ] || [ "$TCSUPPORT_FON_V2" != "" ] ;then
		if [ "$Bssid_num" -ge "2" ] ;then
			brctl delif br0 ra1
			ifconfig ra1 down
		fi
	fi
i=0
while [ "$i" -lt "$Bssid_num" ];do
	unset ssid$i
	i=`expr $i + 1`
done	
fi
else
if [ "$TCSUPPORT_WLAN_MT7915D" != "" ] || [ "$TCSUPPORT_WLAN_MT7916D" != "" ];then
echo "enter 7915D/7916D operation"
ssid0=0
ssid1=0
ssid2=0
ssid3=0
i=0
CONFFILE=/etc/Wireless/WLAN_APOn
if [ -f $CONFFILE ] ;then
	chmod 777 $CONFFILE
	. $CONFFILE
	if [ "$TCSUPPORT_WLAN_PERSSID_SWITCH" != "" ] ;then
		case "$APOn" in
			"1" )
				isAPON=1
				ifconfig ra0 0.0.0.0 up
				ifconfig ra0 0.0.0.0 down
				while [ "$i" -lt "$Bssid_num" ];do
					case "$i" in
					"0" )
						if [ "$ssid0" = "1" ] ;then 
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"1" )
						if [ "$ssid1" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"2" )
						if [ "$ssid2" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"3" )
						if [ "$ssid3" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
				 	"4" )
						if [ "$ssid4" = "1" ] ;then 
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"5" )
						if [ "$ssid5" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"6" )
						if [ "$ssid6" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"7" )
						if [ "$ssid7" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					esac
					i=`expr $i + 1`
					done
					if [ "$TCSUPPORT_WLAN_ANTENNA_DIVERSITY" != "" ] ;then
						/userfs/bin/iwpriv ra0 set ant_div_dis=0-$wlan_ant_dis
						/userfs/bin/iwpriv ra0 set ant_div_convert=0-$wlan_ant_convert
						if ["$wlan_ant_dis" = "1"] ;then
							/userfs/bin/iwpriv ra0 set ant_div_sel_ant=0-$wlan_ant_sel
						fi
					fi
				;;
			"0" )
				while [ "$i" -lt "$Bssid_num" ];do
					if [ "$i" = "0" ] ;then
						ifconfig ra$i 0.0.0.0 up
						brctl addif br0 ra$i
						ifconfig ra$i 0.0.0.0 down
					fi
					i=`expr $i + 1`
				done
				echo "@@@2G@@@,Radio is off!!!!!!!!"
				;;
		esac
	else
		while [ "$i" -lt "$Bssid_num" ];do
			case "$APOn" in
				"1" )
					isAPON=1
					ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
					;;
				"0" )	
					ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
					ifconfig ra$i 0.0.0.0 down
					;;
			esac
		i=`expr $i + 1`
		done
	fi
	if [ "$TCSUPPORT_MAX_PACKET_2000" != "" ] ;then
		ifconfig ra0 mtu 2000
		##add by GongFan for wifi mtu, 2023.3.10
		ifconfig ra1 mtu 2000
		##add end
	fi

	if [ "$TCSUPPORT_WLAN_WDS" != "" ] ;then
		echo "TCSUPPORT_WLAN_WDS"
		
		if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
					ifconfig wds0 0.0.0.0 up
					brctl addif br0 wds0
					ifconfig wds1 0.0.0.0 up
					brctl addif br0 wds1
					ifconfig wds2 0.0.0.0 up
					brctl addif br0 wds2
					ifconfig wds3 0.0.0.0 up
					brctl addif br0 wds3
				;;
			"0" )
				;;
		esac
		fi
	fi
	i=0
	while [ "$i" -lt "$Bssid_num" ];do
		unset ssid$i
		i=`expr $i + 1`
	done
fi
ssid0=0
ssid1=0
ssid2=0
ssid3=0
i=0
CONFFILE=/etc/Wireless/WLAN_APOn_AC
if [ -f $CONFFILE ] ;then
	chmod 777 $CONFFILE
	. $CONFFILE
	if [ "$TCSUPPORT_WLAN_PERSSID_SWITCH" != "" ] ;then
		case "$APOn" in
			"1" )
				isAPON=1
				while [ "$i" -lt "$Bssid_num" ];do
				 	case "$i" in
				 	"0" )
						if [ "$ssid0" = "1" ] ;then 
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"1" )
						if [ "$ssid1" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"2" )
						if [ "$ssid2" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"3" )
						if [ "$ssid3" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
				 	"4" )
						if [ "$ssid4" = "1" ] ;then 
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"5" )
						if [ "$ssid5" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"6" )
						if [ "$ssid6" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"7" )
						if [ "$ssid7" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					esac
					i=`expr $i + 1`
					done
					if [ "$TCSUPPORT_WLAN_ANTENNA_DIVERSITY" != "" ] ;then
						/userfs/bin/iwpriv rai0 set ant_div_dis=1-$wlan11ac_ant_dis
						/userfs/bin/iwpriv rai0 set ant_div_convert=1-$wlan11ac_ant_convert
						if [ "$wlan11ac_ant_dis" = "1" ];then
							/userfs/bin/iwpriv rai0 set ant_div_sel_ant=1-$wlan11ac_ant_sel
						fi
					fi
				;;
			"0" )
				while [ "$i" -lt "$Bssid_num" ];do
					if [ "$i" = "0" ] ;then
						ifconfig rai$i 0.0.0.0 up
						brctl addif br0 rai$i
						ifconfig rai$i 0.0.0.0 down
					fi
					i=`expr $i + 1`
				done
				echo "@@@5G@@@,Radio is off!!!!!!!!"
				;;
		esac
	else
		while [ "$i" -lt "$Bssid_num" ];do
			case "$APOn" in
				"1" )
					isAPON=1
					ifconfig rai$i 0.0.0.0 up
					brctl addif br0 rai$i
					;;
				"0" )	
					ifconfig rai$i 0.0.0.0 up
					brctl addif br0 rai$i
					ifconfig rai$i 0.0.0.0 down
					;;
			esac	
		i=`expr $i + 1`
		done
	fi
	##add by GongFan for wifi mtu, 2023.3.10
	if [ "$TCSUPPORT_MAX_PACKET_2000" != "" ] ;then
		ifconfig rai1 mtu 2000
	fi
	##add end
	if [ "$TCSUPPORT_WLAN_WDS" != "" ] ;then
		echo "TCSUPPORT_WLAN_WDS"
		if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
					ifconfig wdsi0 0.0.0.0 up
					brctl addif br0 wdsi0
					ifconfig wdsi1 0.0.0.0 up
					brctl addif br0 wdsi1
					ifconfig wdsi2 0.0.0.0 up
					brctl addif br0 wdsi2
					ifconfig wdsi3 0.0.0.0 up
					brctl addif br0 wdsi3
				;;
			"0" )
				;;
		esac
		fi
	fi
	i=0
	while [ "$i" -lt "$Bssid_num" ];do
		unset ssid$i
		i=`expr $i + 1`
	done	
fi
else
i=0
CONFFILE=/etc/Wireless/WLAN_APOn

if [ -f $CONFFILE ] ;then
	chmod 777 $CONFFILE
	. $CONFFILE
	if [ "$TCSUPPORT_WLAN_PERSSID_SWITCH" != "" ] ;then
		case "$APOn" in
			"1" )
				isAPON=1
				while [ "$i" -lt "$Bssid_num" ];do
				 	case "$i" in
				 	"0" )
						if [ "$ssid0" = "1" ] ;then 
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						else
							ifconfig ra0 0.0.0.0 up
							ifconfig ra0 0.0.0.0 down
						fi
						;;
					"1" )
						if [ "$ssid1" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"2" )
						if [ "$ssid2" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"3" )
						if [ "$ssid3" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
				 	"4" )
						if [ "$ssid4" = "1" ] ;then 
							ifconfig ra$i 0.0.0.0 up
							brctl addif br0 ra$i
						fi
						;;
					"5" )
						if [ "$ssid5" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"6" )
						if [ "$ssid6" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					"7" )
						if [ "$ssid7" = "1" ] ;then
							ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
						fi
						;;
					esac
					i=`expr $i + 1`
					done
				;;
			"0" )
				while [ "$i" -lt "$Bssid_num" ];do
					if [ "$i" = "0" ] ;then
						ifconfig ra$i 0.0.0.0 up
						brctl addif br0 ra$i
						ifconfig ra$i 0.0.0.0 down
					fi
					i=`expr $i + 1`
				done
				echo "@@@2G@@@,Radio is off!!!!!!!!"
				;;
		esac
	else
		while [ "$i" -lt "$Bssid_num" ];do
			case "$APOn" in
				"1" )
					isAPON=1
					ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
					;;
				"0" )	
					ifconfig ra$i 0.0.0.0 up
					brctl addif br0 ra$i
					ifconfig ra$i 0.0.0.0 down
					;;
			esac	
		i=`expr $i + 1`
		done
	fi
	if [ "$TCSUPPORT_MAX_PACKET_2000" != "" ] ;then
		ifconfig ra0 mtu 2000
	fi

	if [ "$TCSUPPORT_WLAN_WDS" != "" ] ;then
		echo "TCSUPPORT_WLAN_WDS"
		if [ "$TCSUPPORT_C1_OBM" != "" ] ;then
			if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
				if [ "$Wds0ON" = "1" ] ;then
					ifconfig wds0 0.0.0.0 up
					brctl addif br0 wds0
				fi
				if [ "$Wds1ON" = "1" ] ;then
					ifconfig wds1 0.0.0.0 up
					brctl addif br0 wds1
				fi
				if [ "$Wds2ON" = "1" ] ;then
					ifconfig wds2 0.0.0.0 up
					brctl addif br0 wds2
				fi
				if [ "$Wds3ON" = "1" ] ;then
					ifconfig wds3 0.0.0.0 up
					brctl addif br0 wds3
				fi
				;;
			"0" )
				;;
		esac
			fi
		else
			if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
					ifconfig wds0 0.0.0.0 up
					brctl addif br0 wds0
					ifconfig wds1 0.0.0.0 up
					brctl addif br0 wds1
					ifconfig wds2 0.0.0.0 up
					brctl addif br0 wds2
					ifconfig wds3 0.0.0.0 up
					brctl addif br0 wds3
				;;
			"0" )
				;;
		esac
		fi
	fi
	fi
	if [ "$TCSUPPORT_FON" != "" ] || [ "$TCSUPPORT_FON_V2" != "" ] ;then
		if [ "$Bssid_num" -ge "2" ] ;then
			brctl delif br0 ra1
			ifconfig ra1 down
		fi
	fi
	if [ "$TCSUPPORT_WLAN_LED_BY_SW" != "" ] ;then
		if [ "$APOn" = "1" ] ;then
			echo 1 > /proc/tc3162/led_wlan
		else
			echo 0 > /proc/tc3162/led_wlan
		fi
	fi
i=0
while [ "$i" -lt "$Bssid_num" ];do
	unset ssid$i
	i=`expr $i + 1`
done
fi
i=0
CONFFILE=/etc/Wireless/WLAN_APOn_AC

if [ -f $CONFFILE ] ;then
	chmod 777 $CONFFILE
	. $CONFFILE
	if [ "$TCSUPPORT_WLAN_PERSSID_SWITCH" != "" ] ;then
		case "$APOn" in
			"1" )
				isAPON=1
				while [ "$i" -lt "$Bssid_num" ];do
				 	case "$i" in
				 	"0" )
						if [ "$ssid0" = "1" ] ;then 
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						else
							ifconfig rai0 0.0.0.0 up
							ifconfig rai0 0.0.0.0 down
						fi
						;;
					"1" )
						if [ "$ssid1" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"2" )
						if [ "$ssid2" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"3" )
						if [ "$ssid3" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
				 	"4" )
						if [ "$ssid4" = "1" ] ;then 
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"5" )
						if [ "$ssid5" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"6" )
						if [ "$ssid6" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					"7" )
						if [ "$ssid7" = "1" ] ;then
							ifconfig rai$i 0.0.0.0 up
							brctl addif br0 rai$i
						fi
						;;
					esac
					i=`expr $i + 1`
					done
				;;
			"0" )
				while [ "$i" -lt "$Bssid_num" ];do
					if [ "$i" = "0" ] ;then
						ifconfig rai$i 0.0.0.0 up
						brctl addif br0 rai$i
						ifconfig rai$i 0.0.0.0 down
					fi
					i=`expr $i + 1`
				done
				echo "@@@5G@@@,Radio is off!!!!!!!!"
				;;
		esac
	else
		while [ "$i" -lt "$Bssid_num" ];do
			case "$APOn" in
				"1" )
					isAPON=1
					ifconfig rai$i 0.0.0.0 up
					brctl addif br0 rai$i
					;;
				"0" )	
					ifconfig rai$i 0.0.0.0 up
					brctl addif br0 rai$i
					ifconfig rai$i 0.0.0.0 down
					;;
			esac	
		i=`expr $i + 1`
		done
	fi
	
	if [ "$TCSUPPORT_WLAN_WDS" != "" ] ;then
		echo "TCSUPPORT_WLAN_WDS"
		if [ "$APOn" = "1" ] ;then
		case "$WdsEnable" in
			"1"|"2"|"3"|"4" )
					ifconfig wdsi0 0.0.0.0 up
					brctl addif br0 wdsi0
					ifconfig wdsi1 0.0.0.0 up
					brctl addif br0 wdsi1
					ifconfig wdsi2 0.0.0.0 up
					brctl addif br0 wdsi2
					ifconfig wdsi3 0.0.0.0 up
					brctl addif br0 wdsi3
				;;
			"0" )
				;;
		esac
	fi
fi
	i=0
	while [ "$i" -lt "$Bssid_num" ];do
		unset ssid$i
		i=`expr $i + 1`
	done
fi
fi
fi

if [ "$TCSUPPORT_WLAN_LED_BY_SW" != "" ] ;then
	if [ "$isAPON" = "1" ] ;then
			echo 1 > /proc/tc3162/led_wlan
	else
			echo 0 > /proc/tc3162/led_wlan
	fi
fi

fi
if [ "$TCSUPPORT_CFG_NG" != "" ] ;then
	/userfs/bin/tcapi set globalstate_common wlanLoad 1
	if [ "$TCSUPPORT_WLAN_8021X" != "" ] ;then
			killall -9 rtdot1xd
			/userfs/bin/rtdot1xd
			killall -9 rtdot1xd_AC
			/userfs/bin/rtdot1xd_AC
	fi
	if [ "$TCSUPPORT_WLAN_APCLIENT" != "" ] ;then
			ifconfig apcli0 up
			ifconfig apclii0 up
	fi
	if [ "$TCSUPPORT_NP_CMCC" != "" ] ;then
			WLANAPON=`/userfs/bin/tcapi get WLan_Common APOn`
			if [ "$WLANAPON" = "0" ];then
				sys wlanled off
			fi
			WLAN11ACAPON=`/userfs/bin/tcapi get WLan11ac_Common APOn`
			if [ "$WLAN11ACAPON" = "0" ];then
				sys wlan11acled off
			fi
	fi
	if [ "$TCSUPPORT_CT_UBUS" != "" ] ;then
			WORKMODE=`/userfs/bin/tcapi get Wan_Common WorkMode`
			if [ "$WORKMODE" = "repeater" ];then
				/userfs/bin/tcapi commit apcli
			fi
	fi
fi
/usr/script/dmesg.sh
#if [ "$TCSUPPORT_ECNT_MAP" = "" ] ;then
	#/userfs/bin/iwpriv ra0 set WscGenPinCode =1
	#/userfs/bin/iwpriv rai0 set WscGenPinCode =1
#else
	/userfs/bin/iwpriv ra1 set WscGenPinCode =1
	/userfs/bin/iwpriv rai1 set WscGenPinCode =1
#fi
if [ "$TCSUPPORT_CT_WLAN_JOYME3" != "" ] ;then
	MACPOLICY=`/userfs/bin/tcapi get MacWhiteList_Common MACPolicy`
	if [ $MACPOLICY = '1' ] ;then
		/userfs/bin/tcapi commit MacWhiteList
	else
		/userfs/bin/tcapi commit MacBlackList
	fi
fi
if [ "$TCSUPPORT_CPU_EN7523" != "" ];then
	if [ "$TCSUPPORT_WLAN_MT7615_TXOFFLOAD" != "" ];then
		/userfs/bin/irqCpuBind set rai0 2
	fi
fi
if [ "$TCSUPPORT_CWMP_NG" != "" ];then
	/userfs/bin/tcapi set wifiNeighborTab.Common Startup_Force_Updated 1
	/userfs/bin/tcapi set wifiNeighborTab.Common Allow_Updated  1
	/userfs/bin/tcapi get wifiNeighborTab.pvc.1.entry.1 Channel
fi
#add by gerald for TRUE 2.4G smart antenna
ANTENNAMODE=`/userfs/bin/tcapi get WLan_Common AntennaMode`
SMARTANTENNA=`/userfs/bin/tcapi get WLan_Common SmartAntenna`
if [ "$ANTENNAMODE" = "0" ] ;then
SMARTANTENNA="2"
fi
/bin/echo "current smart antenna: ANT1 + ANT$SMARTANTENNA" > /tmp/smartAntennaSelect
if [ "$TCSUPPORT_CT_2G_SMART_ANTENNA" != "" ] ;then
/userfs/bin/iwpriv ra0 mac 70005050=05000000
/userfs/bin/iwpriv ra0 mac 70005054=33000005
/userfs/bin/iwpriv ra0 mac 70004030=00010140
	if [ "$SMARTANTENNA" = "3" ];then
		#ANT1+ANT3(Web) or ANT0+ANT2(driver), GPIO6=0 (Low),  GPIO8=1 (High)
		/userfs/bin/iwpriv ra0 mac 70004020=00010100
	else
		#ANT1+ANT2(Web) or ANT0+ANT1(driver), GPIO6=1 (High), GPIO8=0 (Low)
		/userfs/bin/iwpriv ra0 mac 70004020=00010040
	fi
fi
#end by gerald for TRUE 2.4G smart antenna

/bin/echo "wifi modules ok!!!" > /tmp/wifi_load_finished
#wlan init protection unlock, used by check_reboot_need_delay.sh
echo 0 > /tmp/wlan_init_protection

if [ "TCSUPPORT_MEMORY_SHRINK_V2" != "" ] ;then
echo 3 > /proc/sys/vm/drop_caches
fi