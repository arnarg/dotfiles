#! /bin/bash

dir=$(dirname $0)
source $dir/config

wifi() {
	WIFI_SSID=$(iwconfig $interface | awk 'NR==1 {print $4}' | sed -r 's/ESSID:"(.+)"/\1/');
	STRENGTH=$(iwconfig $interface | awk 'NR==6 {print $4}' | sed -r 's/level=([0-9]+)\/100/\1/');
	if [ -z $WIFI_SSID ]
	then
		echo 'P'"%{F$COLOR_RED}"$WIFI "Down%{F-}"
	else
		echo 'P'$WIFI $STRENGTH% - $WIFI_SSID
	fi
}

while true;
	do
		wifi > "$PANEL_FIFO";
		sleep 5s;
done
