#!/bin/sh
set -eu

data_home=${LF_DATA_HOME:-${XDG_DATA_HOME:-"$HOME/.local/share"}}
selection_file=$data_home/lf/files
[ -s "$selection_file" ] || exit 0

mode=$(sed -n '1p' "$selection_file")
sed '1d' "$selection_file" | while IFS= read -r src; do
    [ -n "$src" ] || continue
    case "$mode" in
        copy) cp -Rf -- "$src" . ;;
        move) mv -f -- "$src" . ;;
        *) printf 'Unknown LF paste mode: %s\n' "$mode" >&2; exit 1 ;;
    esac
done

if [ "$mode" = move ]; then
    rm -f -- "$selection_file"
    lf -remote 'send clear'
fi
