#! /bin/bash

source config

while true;
	do
		echo 'D' $(date '+%a %d %b %H:%M') > "$PANEL_FIFO"
		sleep 1m
done
