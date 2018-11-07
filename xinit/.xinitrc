#!/bin/bash

########################################
# keyboard and launch stuff
########################################

# for some reason this is not working
~/bin/preload.sh &

# make capslock control
setxkbmap -option ctrl:nocaps &
# make altgr control
setxkbmap -option ctrl:ralt_rctrl &

# only works if called twice
~/bin/set-dual-external.sh &
~/bin/set-dual-external.sh &

# music
mpd &

# wifi
sudo wicd &

# start dropbox
~/.dropbox-dist/dropboxd &

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
