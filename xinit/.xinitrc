#!/bin/bash

########################################
# keyboard and launch stuff
########################################
. ~/bin/preload.sh &

# music
mpd &

# wifi
sudo wicd &

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
