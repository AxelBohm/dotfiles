#!/bin/bash

########################################
# keyboard and launch stuff
########################################

# for some reason this is not working
. preload.sh &

# # make capslock control
# setxkbmap -option ctrl:nocaps &
# # make altgr control
# setxkbmap -option ctrl:ralt_rctrl &

# # only works if called twice
~/bin/xrandr/set-dual-external.sh &
~/bin/xrandr/set-dual-external.sh &

# # music
# mpd &

# # wifi
# sudo wicd &

# # start dropbox
# ~/.dropbox-dist/dropboxd &

########################################
# DWM
########################################

# Statusbar
. dwm-status.sh &

# set background
~/.fehbg &

# Autostart section
pcmanfm & 

exec dwm
