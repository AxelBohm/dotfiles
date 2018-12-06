#!/bin/bash

external=$(xrandr | grep -o "VGA[\w'-]*\w*")
internal=$(xrandr | grep -o "LVDS[\w'-]*\w*")

if xrandr | grep "$external connected"; then
    xrandr --output $internal --off --output $external --auto
fi

# set wallpaper again
feh --bg-fill ~/.wallpapers/*
