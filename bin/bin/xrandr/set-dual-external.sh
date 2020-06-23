#!/bin/bash

xrandr --output LVDS1 --off --output HDMI2 --mode 1920x1080 --output HDMI3 --mode 1920x1080 --left-of HDMI2

# set wallpaper again
set_background.sh &
set_background.sh &
