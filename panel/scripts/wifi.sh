#! /bin/bash

dir=$(dirname $0)
source $dir/config

wifi() {
	WIFI_SSID=$(iw wlp3s0 link | grep 'SSID' | sed 's/SSID: //' | sed 's/\t//');
	if [ -z $WIFI_SSID ]
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
