#!/bin/sh

# udhcpc script edited by Tim Riker <Tim@Rikers.org>
[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
	chmod 777 $PROFILE_CFG
	. $PROFILE_CFG
fi
if [ "$TCSUPPORT_DNSEACHPVC" != "" ] ;then
	RESOLV_CONF="/etc/resolv_"$interface".conf"
else
	RESOLV_CONF="/etc/resolv.conf"
fi
#GATEWAY_FILE="/etc/"$interface"_gateway.conf"
DNS_FILE="/var/run/"$interface"/dns"
GATEWAY_FILE="/var/run/"$interface"/gateway"
STATUS_FILE="/var/run/"$interface"/status"
IP_FILE="/var/run/"$interface"/ip"
NETMASK_FILE="/var/run/"$interface"/netmask"
VXLAN_IF="vxlan"
if [ "$TCSUPPORT_ECNT_MAP" != "" ] ;then
	ROUTE_ROLE=`/userfs/bin/tcapi get mesh_common DeviceRole`
	if [ "$TCSUPPORT_MAP_CONTROLLER_AGENT" != "" ] || [ "$TCSUPPORT_PON_MAP_CONTROLLER_AGENT" != "" ] ;then
		WANMODE_TYPE=`/userfs/bin/tcapi get wan_pvc0_entry0 WanMode`
	fi
fi
[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
[ -n "$subnet" ] && NETMASK="netmask $subnet"

case "$1" in
	deconfig)
		#/sbin/ifconfig $interface down
		/sbin/ifconfig $interface 0.0.0.0
		
		echo "down" > $STATUS_FILE		
		echo nameserver 127.0.0.1 > /etc/resolv.conf
		
		if [ "$interface" = "br0" ] ; then
			/userfs/bin/tcapi set Lan_Entry IP $ip
			/userfs/bin/tcapi commit Lan
						
		else
		if [ -f "/tmp/use_cfg_ng" ] ; then
			if [ "$TCSUPPORT_VXLAN" != "" ] ;then
				if [[ $interface == $VXLAN_IF* ]] ;then
					/userfs/bin/msg send_ext 7 241 $interface
				else
					if [ "$TCSUPPORT_NP_CMCC" != "" ] || [ "$TCSUPPORT_CT_UBUS" != "" ] ;then
						if [ "$interface" = "br0:1" ] ; then
							/userfs/bin/msg send_ext 1 14 $interface
						else
							/userfs/bin/msg send_ext 1 4 $interface
						fi
					else
						/userfs/bin/msg send_ext 1 4 $interface
					fi
				fi
			else

				if [ "$TCSUPPORT_NP_CMCC" != "" ] || [ "$TCSUPPORT_CT_UBUS" != "" ] ;then
					if [ "$interface" = "br0:1" ] ; then
						/userfs/bin/msg send_ext 1 14 $interface
					else
						/userfs/bin/msg send_ext 1 4 $interface
					fi
				else
					/userfs/bin/msg send_ext 1 4 $interface
				fi
			fi
		else
			/userfs/bin/tcapi commit WanInfo_Message_$interface/4
		fi		
		fi

		if [ -f $DNS_FILE ]; then
		rm $DNS_FILE
		fi
		if [ -f $GATEWAY_FILE ]; then 
		rm $GATEWAY_FILE
		fi
		if [ -f $NETMASK_FILE ]; then		
		rm $NETMASK_FILE
		fi
		if [ -f $IP_FILE ]; then		
		rm $IP_FILE
		fi
		;;

	renew|bound)
		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK		
		echo $ip > $IP_FILE
		echo $subnet > $NETMASK_FILE		
		
		if [ -n "$router" ] ; then
			echo "writing routers to file"
			for i in $router ; do
				echo $i > $GATEWAY_FILE
				if [ "$TCSUPPORT_ECNT_MAP" != "" ] ;then
					if [ "$ROUTE_ROLE" = "2" ] ;then
						#add by wubin add default gateway for tr069 2019-10-12
						/usr/bin/ip route delete default
						route add -net 0.0.0.0 gw $i dev br0
						/userfs/bin/tcapi set DefaultIp_Entry gateway $i
						/userfs/bin/tcapi commit DefaultIp 
						/userfs/bin/tcapi set globalstate ntpneedexecute 1
						/userfs/bin/tcapi set globalstate ntpdelayflag1 1
						/userfs/bin/tcapi set Account_Entry0 Logged 0
						/userfs/bin/tcapi set WebCurSet_Entry0 LoginIp ""
					elif [ "$ROUTE_ROLE" = 1 ] ;then
						if [ "$TCSUPPORT_MAP_CONTROLLER_AGENT" != "" ] || [ "$TCSUPPORT_PON_MAP_CONTROLLER_AGENT" != "" ] ;then
								if [ "$interface" = "br0" ] && [ "$WANMODE_TYPE" = "Bridge" ] ;then
										/userfs/bin/tcapi set DefaultIp_Entry gateway $i			
										/userfs/bin/tcapi commit DefaultIp 
								fi
						fi
					fi
				fi
			done
		fi
		
		echo -n > $RESOLV_CONF
		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
		if [ "$TCSUPPORT_ECNT_MAP" != "" ] ;then
			if [ "$ROUTE_ROLE" = "2" ] ;then
					for i in $dns ; do
						echo adding dns $i
						echo nameserver $i >> $RESOLV_CONF
						#add by wubin add dns for tr069 2019-10-12
						echo nameserver $i >> /etc/resolv.conf
						#add by dengp send res_init message to tr069
						pid=$(ps aux | grep '/userfs/bin/tr69' | grep -v grep | awk '{print $1}')
						if [ -n "$pid" ]; then 
							kill -SIGUSR1 $pid
						fi
					done
			elif [ "$ROUTE_ROLE" = 1 ] ;then
				if [ "$TCSUPPORT_MAP_CONTROLLER_AGENT" != "" ] || [ "$TCSUPPORT_PON_MAP_CONTROLLER_AGENT" != "" ] ;then
					if [ "$interface" = "br0" ] && [ "$WANMODE_TYPE" = "Bridge" ] ;then
						for i in $dns ; do
							echo adding dns $i
							echo nameserver $i >> $RESOLV_CONF
							#add by wubin add dns for tr069 2019-10-12
							echo nameserver $i >> /etc/resolv.conf
						done
					fi
				fi		
			fi
		fi
		#for i in $dns ; do
		#	echo adding dns $i
		#	echo nameserver $i >> $RESOLV_CONF
		#done
		if [ -f $DNS_FILE ]; then
			rm $DNS_FILE
		fi
		for i in $dns ; do	
			echo $i >> $DNS_FILE
		done
		echo "up" > $STATUS_FILE
		#/userfs/bin/tcapi set WanInfo_Message Type Up
		#/userfs/bin/tcapi set WanInfo_Message Interface $interface
		
		if [ "$interface" = "br0" ] ; then
			/userfs/bin/tcapi set Lan_Entry IP $ip
			/userfs/bin/tcapi commit Lan	
		else		
		if [ -f "/tmp/use_cfg_ng" ] ; then
			if [ "$TCSUPPORT_VXLAN" != "" ] ;then
				if [[ $interface == $VXLAN_IF* ]] ;then
					/userfs/bin/msg send_ext 7 240 $interface
				else
					if [ "$TCSUPPORT_NP_CMCC" != "" ] || [ "$TCSUPPORT_CT_UBUS" != "" ] ;then
						if [ "$interface" = "br0:1" ] ; then
							/userfs/bin/msg send_ext 1 13 $interface
						else
							/userfs/bin/msg send_ext 1 3 $interface
						fi
					else
						/userfs/bin/msg send_ext 1 3 $interface
					fi
				fi
			else
				if [ "$TCSUPPORT_NP_CMCC" != "" ] || [ "$TCSUPPORT_CT_UBUS" != "" ] ;then
					if [ "$interface" = "br0:1" ] ; then
						/userfs/bin/msg send_ext 1 13 $interface
					else
						/userfs/bin/msg send_ext 1 3 $interface
					fi
				else
					/userfs/bin/msg send_ext 1 3 $interface
				fi
			fi
		else
			/userfs/bin/tcapi commit WanInfo_Message_$interface/4
		fi
		fi
		;;
		
esac

exit 0
