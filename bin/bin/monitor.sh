#!/bin/bash
EXTERNAL="VGA-1"
INTERNAL="LVDS-1"

if [ ! -f ~/.config/i3/monitor_mode.txt ] ; then
    monitor_mode="all"
else
    monitor_mode=`cat ~/.config/i3/monitor_mode.txt`
fi

if [ $monitor_mode = "all" ]; then
        monitor_mode="external"
        xrandr --output $INTERNAL --off --output $EXTERNAL --auto
elif [ $monitor_mode = "external" ]; then
        monitor_mode="clones"
        xrandr --output $INTERNAL --auto --output $EXTERNAL --auto --same-as $INTERNAL
elif [ $monitor_mode = "clones" ]; then
        monitor_mode="internal"
        xrandr --output $INTERNAL --auto --output $EXTERNAL --off
else
        monitor_mode="all"
        xrandr --output $INTERNAL --auto --output $EXTERNAL --auto --left-of $INTERNAL
fi

# set wallpaper again
feh --bg-fill ~/.config/i3/wallpapers/*

echo "${monitor_mode}" > ~/.config/i3/monitor_mode.txt
