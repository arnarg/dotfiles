#! /bin/bash

dir=$(dirname $0)
source $dir/config

interface=wlp3s0

wifi() {
	WIFI_SSID=$(iwconfig $interface | awk 'NR==1 {print $4}' | sed -r 's/ESSID:"(.+)"/\1/');
	if [ $WIFI_SSID == "ESSID:off/any" ]
	then
		echo 'P'"%{F$COLOR_RED}"$WIFI "Down%{F-}"
	else
		echo 'P'$WIFI $WIFI_SSID
	fi
}

while true;
	do
		wifi > "$PANEL_FIFO";
		sleep 5s;
done
