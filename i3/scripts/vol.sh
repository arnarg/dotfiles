#! /bin/bash

dir=$(dirname $0)
source $dir/config

# Only change volume if a parameter was provided
if ! [ -z $1 ]
then
	if [ $1 == '+' ]
	then
		amixer -q sset 'Master' 5%+ unmute;
	elif [ $1 == '-' ]
	then
		amixer -q sset 'Master' 5%- unmute;
	elif [ $1 == 'M' ]
	then
		amixer -q sset 'Master' toggle;
	fi

	# Signal i3blocks that the volume was updated
	pkill -RTMIN+10 i3blocks && exit
fi

# Always update panel
muted=$(amixer sget 'Master' | awk 'NR==6 {print $6}' | sed -r 's/\[(off|on)\]/\1/');
volume=$(amixer sget 'Master' | awk 'NR==6 {print $5}' | sed -r 's/\[([0-9]+)%\]/\1/');

if [ $muted == "off" ]
then
	icon="";
	echo '<span foreground="'$COLOR_RED'">'$icon "Mute</span>"
elif [ $muted == "on" ]
then
	icon="";
	echo $icon $volume%
fi
