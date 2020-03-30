#!/bin/bash

internal="LVDS1"

monitors=$(xrandr -q)
declare -a ports=("HDMI" "DP" "VGA")
# loop over connectors and break if one of them is connected
for port in "${ports[@]}"
do
    external=$(echo "$monitors" | grep "$port. con" | awk '{print $1}')
    xrandr --output $internal --off --output "$external" --auto && break
done


# set wallpaper again
set_background.sh
set_background.sh
