#!/bin/sh

file=$1

case "$file" in
    *.tar|*.tar.*|*.tgz|*.tbz|*.tbz2|*.txz)
        tar tf "$file" 2>/dev/null
        ;;
    *.zip|*.jar)
        unzip -l "$file" 2>/dev/null
        ;;
    *.rar)
        command -v unrar >/dev/null 2>&1 && unrar l "$file"
        ;;
    *.7z)
        command -v 7z >/dev/null 2>&1 && 7z l "$file"
        ;;
    *.pdf)
        if command -v pdftotext >/dev/null 2>&1; then
            pdftotext "$file" -
        else
            file "$file"
        fi
        ;;
    *)
        if command -v bat >/dev/null 2>&1; then
            bat --color=always --style=plain --paging=never -- "$file"
        elif command -v highlight >/dev/null 2>&1; then
            highlight -O ansi -- "$file" 2>/dev/null || cat -- "$file"
        else
            cat -- "$file"
        fi
        ;;
esac
