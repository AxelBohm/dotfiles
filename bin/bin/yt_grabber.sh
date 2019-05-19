#!/bin/sh
regex='(((https://www.youtube))[.:][^ >"\t]*|www\.[-a-z0-9.]+)[^ .,;\t>">\):]'
url=$(grep -Po "$regex" | uniq | dmenu -l 10 -p "Go:") || exit
youtube-viewer "$url"
