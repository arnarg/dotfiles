source ~/.profile

xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
xset fp rehash
setxkbmap is

sxhkd &
exec bspwm
