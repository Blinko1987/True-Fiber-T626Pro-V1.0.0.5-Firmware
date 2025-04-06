#!/bin/sh
#echo "set_tzn20_led [on/off]"
on_off=$1

#echo "set_tzn20_led $1"

if [ "$on_off" = "off" ] ; then
#led off
	/bin/rm -rf /tmp/fact_ledon
	echo active 22 1 > /proc/tc3162/gpio_output
	echo active 24 1 > /proc/tc3162/gpio_output
	echo active 25 1 > /proc/tc3162/gpio_output
	echo active 26 1 > /proc/tc3162/gpio_output
	sleep 1
	echo active 22 1 > /proc/tc3162/gpio_output
	echo active 24 1 > /proc/tc3162/gpio_output
	echo active 25 1 > /proc/tc3162/gpio_output
	echo active 26 1 > /proc/tc3162/gpio_output
fi

if [ "$on_off" = "on" ] ; then
	echo 1 > /tmp/fact_ledon
fi
	
while [ -f "/tmp/fact_ledon" ] ; do
#2G/5G -> GPIO 22 green
	echo active 22 0 > /proc/tc3162/gpio_output
	echo active 24 1 > /proc/tc3162/gpio_output
	echo active 25 1 > /proc/tc3162/gpio_output
	echo active 26 1 > /proc/tc3162/gpio_output
	sleep 1

#Internet -> GPIO 24 orange
	echo active 22 1 > /proc/tc3162/gpio_output
	echo active 24 0 > /proc/tc3162/gpio_output
	echo active 25 1 > /proc/tc3162/gpio_output
	echo active 26 1 > /proc/tc3162/gpio_output
	sleep 1


#Power -> GPIO 25 red
	echo active 22 1 > /proc/tc3162/gpio_output
	echo active 24 1 > /proc/tc3162/gpio_output
	echo active 25 0 > /proc/tc3162/gpio_output
	echo active 26 1 > /proc/tc3162/gpio_output
	sleep 1

#WPS -> GPIO 26 blue
	echo active 22 1 > /proc/tc3162/gpio_output
	echo active 24 1 > /proc/tc3162/gpio_output
	echo active 25 1 > /proc/tc3162/gpio_output
	echo active 26 0 > /proc/tc3162/gpio_output
	sleep 1	
	
done;	