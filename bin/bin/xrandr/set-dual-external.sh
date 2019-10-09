#!/bin/bash

internal=$(xrandr | grep -o "LVDS[\w'-]*\w*")
externalvga=$(xrandr | grep -o "VGA[\w'-]*\w*")
externalhdmi=$(xrandr | grep -o "HDMI[\w'-]*\w* connected")
# remove the keyword "connected"
externalhdmi=${externalhdmi% connected}

# xrandr --output "LVDS-1" --off --output "VGA-1" --auto --output "HDMI-2" --right-of "VGA-1"
if xrandr | grep "$externalvga connected"; then
    xrandr --output $internal --off
    xrandr --output $externalvga --auto
    xrandr --output $externalhdmi --auto --right-of $externalvga
fi

# set wallpaper again
set_background.sh &
