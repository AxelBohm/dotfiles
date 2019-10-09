#!/bin/sh
regex='(((http|https|ftp|gopher))[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | uniq | dmenu -l 10 -p "Go:") || exit
xdg-open "$url"
notify-send "opening link in browser"
