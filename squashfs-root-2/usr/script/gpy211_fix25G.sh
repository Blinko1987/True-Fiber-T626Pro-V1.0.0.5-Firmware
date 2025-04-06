#!/bin/sh

echo "########gpy211_fix25G.sh START" > /dev/console

PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
	. $PROFILE_CFG
fi

echo "gpy211 reset start" > /dev/console
echo active 27 0 > /proc/tc3162/gpio_output
#delay 5ms(min 500us)
usleep 5000
echo active 27 1 > /proc/tc3162/gpio_output
#delay 20ms(min 2ms)
usleep 20000
echo "gpy211 reset end" > /dev/console

if [ "$TCSUPPORT_ISKRATEL_74HC595" != "" ] ;then
if [ "$TCSUPPORT_GPIO_PSEUDO_MDIO" != "" ] ;then
if [ "$TCSUPPORT_2_5G_LAN_GPY211" != "" ] ;then
	#gpy211 fix 2.5G LAN
	echo 0 1 0 2 0D 001E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E 0008 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0D 401E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E A4FA > /proc/tc3162/pseudo_mdio_test

	#gpy211 LED register
	echo 0 1 0 2 0D 001E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E 0001 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0D 401E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E 0380 > /proc/tc3162/pseudo_mdio_test

	echo 0 1 0 2 0D 001E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E 0002 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0D 401E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 2 0E 0370 > /proc/tc3162/pseudo_mdio_test
fi
if [ "$TCSUPPORT_2_5G_WAN_GPY211" != "" ] ;then
	#gpy211 fix 2.5G WAN
	echo 0 1 0 1 0D 001E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0E 0008 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0D 401E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0E A4FA > /proc/tc3162/pseudo_mdio_test

	#gpy211 LED register
	#echo 0 1 0 1 0D 001E > /proc/tc3162/pseudo_mdio_test
	#echo 0 1 0 1 0E 0001 > /proc/tc3162/pseudo_mdio_test
	#echo 0 1 0 1 0D 401E > /proc/tc3162/pseudo_mdio_test
	#echo 0 1 0 1 0E 0380 > /proc/tc3162/pseudo_mdio_test

	echo 0 1 0 1 0D 001E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0E 0002 > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0D 401E > /proc/tc3162/pseudo_mdio_test
	echo 0 1 0 1 0E 0370 > /proc/tc3162/pseudo_mdio_test
fi
else
if [ "$TCSUPPORT_2_5G_LAN_GPY211" != "" ] ;then
	#7529 MDIO enable
	sys memwl 1fa20218 2001

	#gpy211 fix 2.5G LAN
	tce emiiw 2 0x1E 0x08 0xA4FA

	#gpy211 LED register
	#for iskratel: Double color led(green:2.5G,GPIO0 + red:other,GPIO1)
	tce emiiw 2 0x1E 0x01 0x0380
	tce emiiw 2 0x1E 0x02 0x0370
fi
fi
else
if [ "$TCSUPPORT_2_5G_LAN_GPY211" != "" ] ;then
	#7529 MDIO enable
	sys memwl 1fa20218 2001

	#gpy211 fix 2.5G LAN
	tce emiiw 1 0x1E 0x0008 0xA4FA

	#gpy211 LED register
	#default LED off
	tce emiiw 1 0x0000 0x001B 0x0F00
	#LED Blink after PHY link up
	tce emiiw 1 0x001E 0x0001 0xF3F0
fi
if [ "$TCSUPPORT_2_5G_WAN_GPY211" != "" ] ;then
	#7529 MDIO enable
	sys memwl 1fa20218 2001

	#gpy211 fix 2.5G WAN
	tce emiiw 1 0x1E 0x0008 0xA4FA

	#gpy211 LED register
	#default LED off
	tce emiiw 1 0x0000 0x001B 0x0F00
	#LED Blink after PHY link up
	tce emiiw 1 0x001E 0x0001 0xF3F0
fi
fi

echo "########gpy211_fix25G.sh END" > /dev/console
