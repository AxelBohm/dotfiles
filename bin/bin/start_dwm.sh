# I set up signal on kde plasma so the password is stored in the kwallet keychain..
# signal-desktop --password-store="kwallet6" &
#
# so ucloud will remember my credentials
gnome-keyring-daemon --start

# downloaded ucloud appimage and moved it to this location
~/.local/bin/ucloud-Linux64-3.13.0-build-22805.AppImage &
#
# notifications
dunst &

# lock on suspend, etc
xss-lock slock &

# Statusbar
dwmblocks &

# set background
. set_background.sh &


# start clipmenu daemon to record clipboard
clipmenud &

# lock on suspend, etc
xss-lock slock &


while type dwm >/dev/null ; do dwm && continue || break ; done

# dwm

