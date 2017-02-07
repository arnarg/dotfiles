#!/bin/bash

dir=$(dirname $0)
source $dir/config

curr_keymap=$(setxkbmap -query | awk 'NR==3 {print $2}')

if [[ $1 = "toggle" ]]
then
	case "$curr_keymap" in
		is)
			setxkbmap us
			;;
		us)
			setxkbmap is
			;;
	esac

	# Signal i3blocks that the keymap has changed
	pkill -RTMIN+9 i3blocks && exit
fi

icon=""
echo "$icon  $curr_keymap"
