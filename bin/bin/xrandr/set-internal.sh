#!/bin/bash

internal=$(xrandr | grep -o "LVDS[\w'-]*\w*")
externalvga=$(xrandr | grep -o "VGA[\w'-]*\w*")
externalhdmi=$(xrandr | grep -o "HDMI[\w'-]*\w* connected")
# remove the keyword "connected"
externalhdmi=${externalhdmi% connected}
# remove the space at the end
# externalhdmi="${externalhdmi::-1}"
# echo "$externalhdmi"


xrandr --output $internal --auto --output $externalvga --off --output HDMI1 --off --output HDMI2 --off --output HDMI3 --off --output DP2 --off

# set wallpaper again
set_background.sh

