#!/bin/bash
# dependencies: xbacklight, rofi

BACKLIGHT=$(echo -e "0\n20\n40\n60\n80\n100" | rofi -dmenu -lines 3 -columns 2 -p "Backlight: " -width 20)

[ -z "$BACKLIGHT" ] && exit

xbacklight -set $BACKLIGHT
