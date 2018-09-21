#!/bin/bash


########################################
# keyboard and launch stuff
########################################
. ~/bin/preload.sh &

########################################
# DWM
########################################

# Statusbar
. ~/bin/dwm-status.sh &

# set background
~/.fehbg &
# Autostart section
pcmanfm & 

exec dwm
