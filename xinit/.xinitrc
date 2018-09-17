#!/bin/bash

exec dwm 


########################################
# My stuff
########################################

# key repeat and delay speed
xset r rate 180 70

# make capslock control
setxkbmap -option ctrl:nocaps
# make altgr control
setxkbmap -option ctrl:ralt_rctrl

#dropbox
.dropbox-dist/dropboxd

# wicd for wifi(eduroam)
sudo wicd

# music
mpd
