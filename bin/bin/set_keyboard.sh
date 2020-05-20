#!/bin/bash

# key repeat and delay speed
# xset r rate 180 100

# make capslock control
setxkbmap -option esc:nocaps
# make altgr control
setxkbmap -option ctrl:ralt_rctrl
# make the right control a compose key (for umlauts and stuff)
# setxkbmap -option compose:lctrl
