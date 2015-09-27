#! /bin/bash

dir=$(dirname $0)
source $dir/config

ACPI=$(acpi -b)

if [[ -z $ACPI ]]
then
	exit 1
fi


STATUS=$(echo $ACPI | awk '{print $3}' | sed 's/,//');
BATT_LEVEL=$(echo $ACPI | grep -o '[[:digit:]]\+%' | sed 's/%//');
if [ $STATUS == "Charging" ]
then
	ICON=
else
	if [ $BATT_LEVEL -ge 80 ]
	then
		ICON=
	fi
	if [ $BATT_LEVEL -ge 60 -a $BATT_LEVEL -lt 80 ]
	then
		ICON=
	fi
	if [ $BATT_LEVEL -ge 20 -a $BATT_LEVEL -lt 60 ]
	then
		ICON=
	fi
	if [ $BATT_LEVEL -lt 20 ]
	then
		ICON=
	fi
fi
echo $ICON $BATT_LEVEL%
