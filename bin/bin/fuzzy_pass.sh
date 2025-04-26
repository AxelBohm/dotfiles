#!/bin/bash

while getopts 'pus' flag; do
    case "${flag}" in
        p) info='password' && prompt='Pass';;
        u) info='username' && prompt='Username';;
        s) info='show' && prompt='Show';;
    esac
done

fzf_colours="--color=fg:7,fg+:4,pointer:4,prompt:3,header:2,hl:6,hl+:2,gutter:0"

password=$(pass git ls-files '*.gpg' | sed 's/.gpg$//' |
    fzf "${fzf_colours}" --reverse --margin=5%,25% --header="Select an account:")

case $info in 
    (password) [ -n "$password" ] && pass show -c "$password" ;;
    (show) [ -n "$password" ] && pass show "$password" ;;
    (username) [ -n "$password" ] && pass_get_username $password | copy_to_clipboard;;
esac
