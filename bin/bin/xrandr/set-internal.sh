#!/bin/bash

internal=$(xrandr | grep -o "LVDS[\w'-]*\w*")
externalvga=$(xrandr | grep -o "VGA[\w'-]*\w*")
externalhdmi=$(xrandr | grep -o "HDMI[\w'-]*\w* connected")
# remove the keyword "connected"
externalhdmi=${externalhdmi% connected}
# remove the space at the end
# externalhdmi="${externalhdmi::-1}"
# echo "$externalhdmi"


xrandr --output $internal --auto --output $externalvga --off --output $externalhdmi --off

# set wallpaper again
set_background.sh

