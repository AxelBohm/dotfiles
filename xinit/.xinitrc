#!/bin/bash

########################################
# keyboard and launch stuff
########################################

# for some reason this is not working
. preload.sh &

# # only works if called twice
~/bin/xrandr/set-dual-external.sh &
~/bin/xrandr/set-dual-external.sh &

########################################
# DWM
########################################

# compositor
compton &

# notifications
dunst &

# Statusbar
. dwm-status.sh &

# set background
~/.fehbg &

# Autostart section
pcmanfm & 

exec dwm

