#!/bin/bash

EXTERNAL=$(xrandr | grep -o '^VGA\w*')
INTERNAL=$(xrandr | grep -o '^LVDS\w*')

if xrandr | grep "$EXTERNAL connected"; then
    xrandr --output $INTERNAL --off --output $EXTERNAL --auto
fi

# set wallpaper again
feh --bg-fill ~/.config/i3/wallpapers/*
