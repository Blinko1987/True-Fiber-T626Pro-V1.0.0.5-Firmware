#!/bin/sh

#echo "set_phy_led [wan/lan] [on/off]"
set_phy_led_initfile=/tmp/set_phy_led_init
itf=$1
on_off=$2
echo "set_phy_led $1 $2"

echo "######## set_phy_led.sh START ########" > /dev/console
if [ ! -f $set_phy_led_initfile ] ; then
if [ "$itf" = "lan" ] ;then
	echo 0 1 0 2 0D 0000 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E 001b > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0D 4000 > /proc/tc3162/pseudo_mdio_test
fi
if [ "$itf" = "wan" ] ;then
	echo 0 1 0 1 0D 0000 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0E 001b > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0D 4000 > /proc/tc3162/pseudo_mdio_test
fi	
	echo ok > /tmp/set_phy_led_init
fi

if [ "$on_off" = "off" ] ; then
if [ "$itf" = "lan" ] ;then
	echo 0 1 0 2 0E ff00 > /proc/tc3162/pseudo_mdio_test
fi
if [ "$itf" = "wan" ] ;then	
	echo 0 1 0 1 0E ff00 > /proc/tc3162/pseudo_mdio_test
fi	
	/bin/rm -rf /tmp/fact_ledon
fi

if [ "$on_off" = "on" ] ; then
	echo 1 > /tmp/fact_ledon
fi

while [ -f /tmp/fact_ledon ] ; do
if [ "$itf" = "lan" ] ;then
#open 2.5GLAN led 01
	echo 0 1 0 2 0E fc01 > /proc/tc3162/pseudo_mdio_test
	sleep 1	
#close 2.5GLAN led 10 
	echo 0 1 0 2 0E fd02 > /proc/tc3162/pseudo_mdio_test
	sleep 1
fi

if [ "$itf" = "wan" ] ;then
#open 2.5GWAN led 01
	echo 0 1 0 1 0E fc01 > /proc/tc3162/pseudo_mdio_test
	sleep 1	
#close 2.5GWAN led 10
	echo 0 1 0 1 0E fd02 > /proc/tc3162/pseudo_mdio_test
	sleep 1
fi
done

if [ "$itf" = "lan" ] ;then
	echo 0 1 0 2 0E ff00 > /proc/tc3162/pseudo_mdio_test
fi	
if [ "$itf" = "wan" ] ;then	
	echo 0 1 0 1 0E ff00 > /proc/tc3162/pseudo_mdio_test
fi
	/bin/rm -rf /tmp/fact_ledon
echo "######## set_phy_led.sh exit ########" > /dev/console
