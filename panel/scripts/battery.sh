#! /bin/bash

dir=$(dirname $0)
source $dir/config

battery() {
	STATUS=$(acpi -b | awk '{print $3}' | sed 's/,//');
	BATT_LEVEL=$(acpi -b | grep -o '[[:digit:]]\+%' | sed 's/%//');
	if [ $STATUS == "Charging" ]
	then
		ICON=$CHARGING
	else
		if [ $BATT_LEVEL -ge 80 ]
		then
			ICON=$BATT_FULL
		fi
		if [ $BATT_LEVEL -ge 60 -a $BATT_LEVEL -lt 80 ]
		then
			ICON=$BATT_3QUART
		fi
		if [ $BATT_LEVEL -ge 20 -a $BATT_LEVEL -lt 60 ]
		then
			ICON=$BATT_HALF
		fi
		if [ $BATT_LEVEL -lt 20 ]
		then
			ICON="%{F$COLOR_RED}"$BATT_QUART
		fi
	fi
	echo 'B'$ICON $BATT_LEVEL%"%{F-}"
}

while true;
	do
		battery > "$PANEL_FIFO";
		sleep 10s;
done
