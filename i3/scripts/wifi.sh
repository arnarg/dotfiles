#! /bin/bash

dir=$(dirname $0)
source $dir/config
interface=$(ip route | awk '/^default/ { print $5 ; exit }')

WIFI_SSID=$(iwconfig $interface | awk 'NR==1 {print $4}' | sed -r 's/ESSID:"(.+)"/\1/');
if [ -z $WIFI_SSID ]
then
	echo '<span foreground="'$COLOR_RED'">' "Down</span>"
else
	echo  $WIFI_SSID
fi
