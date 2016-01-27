#!/bin/bash
# dependencies: openvpn, rofi

cd /etc/openvpn

VPN=$(ls *.ovpn | rofi -dmenu -p "VPN: ")

urxvt -e /bin/bash -c "sudo openvpn /etc/openvpn/$VPN"

exit
