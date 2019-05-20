#!/bin/bash

while getopts 'pu' flag; do
    case "${flag}" in
        p) info='password' && prompt='Pass';;
        u) info='username' && prompt='Username';;
    esac
done

password=$(find ~/.password-store/ -name '*.gpg' |
    cut -d'/' -f5- | sed 's/.\{4\}$//' | fzf)

case $info in 
    (password) [ -n "$password" ] && pass show -c "$password" ;;
    (username) [ -n "$password" ] && pass show "$password" | grep username: | awk '{print $2}' | xclip -selection c;;
esac