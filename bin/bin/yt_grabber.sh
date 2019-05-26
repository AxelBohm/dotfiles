#!/bin/sh
regex='(((https://www.youtube))[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | uniq | dmenu -l 10 -p "watch:") || exit
# youtube-viewer "$url"
if [ -n "$url" ]; then
    notify-send "loading youtube video"
    mpv --ytdl  "$url"
fi

