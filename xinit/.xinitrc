#!/bin/bash

########################################
# keyboard and launch stuff
########################################

# for some reason this is not working
. preload.sh &

# # only works if called twice
~/bin/xrandr/set-dual-external.sh &
~/bin/xrandr/set-dual-external.sh &

# dropbox
# owncloud &
. decrypt-owncloud.sh &

########################################
# DWM
########################################

# start clipmenu daemon to record clipboard
clipmenud &

# lock on suspend, etc
xss-lock slock &

# start redshitf
redshift &

# compositor
# compton &

# notifications
dunst &

# Statusbar
# . dwm-status.sh &
dwmblocks &
# slstatus &

# set background
. set_background.sh &

# exec dwm
while type dwm >/dev/null ; do dwm && continue || break ; done
# exec startkde
# export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
# export GNOME_SHELL_SESSION_MODE=classic
# exec gnome-session --session=gnome-classic
