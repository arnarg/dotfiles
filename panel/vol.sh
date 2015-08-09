. panel_vars

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
fi

# Always update panel
muted=$(amixer sget 'Master' | awk 'NR==6 {print $6}' | sed -r 's/\[(off|on)\]/\1/');
volume=$(amixer sget 'Master' | awk 'NR==6 {print $5}' | sed -r 's/\[([0-9]+)%\]/\1/');

if [ $muted == "off" ]
then
	icon="";
	echo 'V'"%{F$COLOR_RED}"$icon "Mute%{F-}" > $PANEL_FIFO
elif [ $muted == "on" ]
then
	icon="";
	echo 'V'$icon $volume% > $PANEL_FIFO
fi
