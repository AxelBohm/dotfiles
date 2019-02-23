#!/bin/bash

########################################
# keyboard and launch stuff
########################################

# for some reason this is not working
. preload.sh &

# # only works if called twice
# ~/bin/xrandr/set-dual-external.sh &

########################################
# DWM
########################################

# compositor
compton &

# Statusbar
. dwm-status.sh &

~/bin/xrandr/set-dual-external.sh &

# set background
~/.fehbg &

# Autostart section
pcmanfm & 

exec dwm

