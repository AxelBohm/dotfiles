#!/bin/bash

xrandr --output LVDS1 --off --output DP2 --mode 2560x1440 --output HDMI3 --mode 1920x1080 --left-of DP2

# set wallpaper again
set_background.sh &
set_background.sh &
