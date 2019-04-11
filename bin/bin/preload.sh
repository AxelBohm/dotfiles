# set screen brightness
# xbacklight -set 55

# output to external if available
# set-external.sh
# set-dual-external.sh
# set-dual-external.sh

# key repeat and delay speed
xset r rate 180 70

# make capslock control
setxkbmap -option ctrl:nocaps
# make altgr control
setxkbmap -option ctrl:ralt_rctrl

# music
mpd

# wifi
sudo dhcpcd wlp2s0

# dropbox
~/.dropbox-dist/dropboxd
./decrypt-dropbox.sh
