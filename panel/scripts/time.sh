#! /bin/bash

dir=$(dirname $0)
source $dir/config

while true;
	do
		echo 'D' $(date '+%a %d %b %H:%M') > "$PANEL_FIFO"
		sleep 1m
done
