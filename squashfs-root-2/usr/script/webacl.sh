#!/bin/sh

PROFILE_CFG=/userfs/profile.cfg

if [ -f $PROFILE_CFG ] ; then
	. $PROFILE_CFG
fi

if [ $# -lt 2 ] ; then
        echo "usage: $0 [interface name]"
        exit 0
fi

WAN_IF=$1
WEBACL_ENABLE=$2
PRENAT_WEBACL=WEBACL_$WAN_IF

#if defined(TCSUPPORT_HGU_VIETTEL)
if [ "$TCSUPPORT_HGU_VIETTEL" != "" ]; then
WAN_HTTPS_ENABLE=`/userfs/bin/tcapi get Firewall_Entry wan_https_enable`
WAN_HTTP_ENABLE=`/userfs/bin/tcapi get Firewall_Entry wan_http_enable`
fi
#endif

iptables -t nat -D PREROUTING -j  $PRENAT_WEBACL  2>/dev/null 1>&2
iptables -t nat -F $PRENAT_WEBACL  2>/dev/null 1>&2
iptables -t nat -X $PRENAT_WEBACL  2>/dev/null 1>&2
ip6tables -t nat -D PREROUTING -j  $PRENAT_WEBACL  2>/dev/null 1>&2
ip6tables -t nat -F $PRENAT_WEBACL  2>/dev/null 1>&2
ip6tables -t nat -X $PRENAT_WEBACL  2>/dev/null 1>&2
#ifndef TCSUPPORT_HGU_VIETTEL
if [ "$TCSUPPORT_HGU_VIETTEL" = "" ]; then
	iptables -t filter -D INPUT -p tcp -i $WAN_IF --dport 80 -j ACCEPT  2>/dev/null 1>&2
	ip6tables -t filter -D INPUT -p tcp -i $WAN_IF --dport 80 -j ACCEPT  2>/dev/null 1>&2
if [ "$TCSUPPORT_CT_HGU_TRUE" != "" ]; then
	iptables -t mangle -D PREROUTING -i $WAN_IF -p tcp --dport 80 -j DROP 2>/dev/null 1>&2
	ip6tables -t mangle -D PREROUTING -i $WAN_IF -p tcp --dport 80 -j DROP 2>/dev/null 1>&2
fi
fi
#endif
if [ "$WEBACL_ENABLE" = "STOP" ] ; then
	iptables -t mangle -A PREROUTING -i $WAN_IF -p tcp --dport 80 -j DROP 2>/dev/null 1>&2
	ip6tables -t mangle -A PREROUTING -i $WAN_IF -p tcp --dport 80 -j DROP 2>/dev/null 1>&2
	exit 0
else

	WEBACL_PORT=$3

	iptables -t nat -N $PRENAT_WEBACL  2>/dev/null 1>&2
	ip6tables -t nat -N $PRENAT_WEBACL  2>/dev/null 1>&2
#ifndef TCSUPPORT_HGU_VIETTEL
if [ "$TCSUPPORT_HGU_VIETTEL" = "" ]; then
if [ "$TCSUPPORT_CT_HGU_TRUE" != "" ]; then
	if [ "$WEBACL_PORT" != "80" ]; then
		iptables -t nat -A $PRENAT_WEBACL -p tcp -i $WAN_IF  --dport $WEBACL_PORT -j REDIRECT --to-ports 80  2>/dev/null 1>&2
		iptables -t mangle -A PREROUTING -i $WAN_IF -p tcp --dport 80 -j DROP 2>/dev/null 1>&2
    
		ip6tables -t nat -A $PRENAT_WEBACL -p tcp -i $WAN_IF  --dport $WEBACL_PORT -j REDIRECT --to-ports 80  2>/dev/null 1>&2
		ip6tables -t mangle -A PREROUTING -i $WAN_IF -p tcp --dport 80 -j DROP 2>/dev/null 1>&2
	fi
else
		iptables -t nat -A $PRENAT_WEBACL -p tcp -i $WAN_IF  --dport $WEBACL_PORT -j REDIRECT --to-ports 80  2>/dev/null 1>&2
fi
fi
#endif
	iptables -t nat -I PREROUTING -j  $PRENAT_WEBACL  2>/dev/null 1>&2
	ip6tables -t nat -I PREROUTING -j  $PRENAT_WEBACL  2>/dev/null 1>&2
#ifndef TCSUPPORT_HGU_VIETTEL
if [ "$TCSUPPORT_HGU_VIETTEL" = "" ]; then
	iptables -t filter -I INPUT -p tcp -i $WAN_IF --dport 80 -j ACCEPT  2>/dev/null 1>&2
	ip6tables -t filter -I INPUT -p tcp -i $WAN_IF --dport 80 -j ACCEPT  2>/dev/null 1>&2
fi
#endif

#if defined(TCSUPPORT_HGU_VIETTEL)
if [ "$TCSUPPORT_HGU_VIETTEL" != "" ]; then
	if [ "$TCSUPPORT_WEBSERVER_SSL" != "" ] && [ "$WAN_HTTPS_ENABLE" = "1" ];then
		iptables -t filter -D INPUT -p tcp -i $WAN_IF --dport 443 -j ACCEPT  2>/dev/null 1>&2
		iptables -t nat -A $PRENAT_WEBACL -p tcp -i $WAN_IF  --dport $WEBACL_PORT -j REDIRECT --to-ports 443  2>/dev/null 1>&2
		iptables -t filter -I INPUT -p tcp -i $WAN_IF --dport 443 -j ACCEPT  2>/dev/null 1>&2
	fi

	if [ "$WAN_HTTP_ENABLE" = "1" ] ; then
		iptables -t filter -D INPUT -p tcp -i $WAN_IF --dport 80 -j ACCEPT  2>/dev/null 1>&2
		iptables -t nat -A $PRENAT_WEBACL -p tcp -i $WAN_IF  --dport $WEBACL_PORT -j REDIRECT --to-ports 80  2>/dev/null 1>&2
		iptables -t filter -I INPUT -p tcp -i $WAN_IF --dport 80 -j ACCEPT  2>/dev/null 1>&2
	fi
fi
#endif
fi
