# I set up signal on kde plasma so the password is stored in the kwallet keychain..
# signal-desktop --password-store="kwallet6" &
#
# so ucloud will remember my credentials
gnome-keyring-daemon --start

# somehow I still need to start it like this..
signal-desktop --password-store="gnome-libsecret" &

# downloaded ucloud appimage and moved it to this location
~/.local/bin/ucloud-Linux64-3.13.0-build-22805.AppImage &

# screen color at night
redshift-gtk &

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

# no sounds
xset -b

# set path so dmenu will have my scripts
export PATH="$HOME/bin:$PATH"

while type dwm >/dev/null ; do dwm && continue || break ; done

# dwm

