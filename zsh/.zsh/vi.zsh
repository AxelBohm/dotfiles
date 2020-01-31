###############################################################
# => vi mode
###############################################################

# leave insert mode without esc
bindkey -M viins 'jk' vi-cmd-mode

# change curser depending on mode
zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    printf "\033[2 q"
else
    printf "\033[4 q"
fi
}
zle -N zle-keymap-select
zle-line-init () {
zle -K viins
printf "\033[4 q"
}
zle -N zle-line-init
bindkey -v

# rebind some of the keys
bindkey "^R" history-incremental-search-backward
bindkey "\eq" quote-line
bindkey "^K" backward-kill-line

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^f' forward-char
bindkey '^b' backward-char

