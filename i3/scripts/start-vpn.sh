#!/bin/bash

cd /etc/openvpn

VPN=$(ls *.ovpn | rofi -dmenu -p "VPN: ")

urxvt -e /bin/bash -c "sudo openvpn /etc/openvpn/$VPN"

exit
