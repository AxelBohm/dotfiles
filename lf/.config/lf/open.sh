#!/bin/sh

if [ "${1-}" = --ask ]; then
    shift
    if [ "$(uname -s)" = Darwin ]; then
        printf 'Open with application: '
        IFS= read -r app
        [ -n "$app" ] && open -a "$app" -- "$@"
    elif command -v mimeopen >/dev/null 2>&1; then
        mimeopen --ask -- "$@"
    else
        printf 'mimeopen is required for choosing an application\n' >&2
        exit 1
    fi
    exit
fi

case "${1-}" in
    *.org)
        exec emacsclient -c -- "$@"
        ;;
esac

case "$(file --mime-type -Lb -- "$1")" in
    text/*|application/json|application/xml)
        exec "${EDITOR:-vi}" "$@"
        ;;
esac

if [ "$(uname -s)" = Darwin ]; then
    open -- "$@"
elif command -v xdg-open >/dev/null 2>&1; then
    for file in "$@"; do xdg-open "$file" >/dev/null 2>&1 & done
else
    printf 'No desktop file opener found\n' >&2
    exit 1
fi
