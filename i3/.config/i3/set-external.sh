#!/bin/bash
EXTERNAL=VGA-1
INTERNAL=LVDS-1


if xrandr | grep "$EXTERNAL connected"; then
    xrandr --output $INTERNAL --off --output $EXTERNAL --auto
fi

# set wallpaper again
feh --bg-fill ~/.config/i3/wallpapers/*
