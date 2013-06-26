/usr/bin/VBoxClient-all

urxvtd &
exec awesome

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources


[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults

