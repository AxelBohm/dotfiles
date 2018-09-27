# set screen brightness
# xbacklight -set 55

# output to external if available
set-external.sh

# key repeat and delay speed
xset r rate 180 70

# make capslock control
setxkbmap -option ctrl:nocaps
# make altgr control
setxkbmap -option ctrl:ralt_rctrl

# dropbox
~/.dropbox-dist/dropboxd

# music
mpd
