bindkey -e
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY

# use z installed from package manager
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

###############################################################
# => vi mode
###############################################################
# Show vi mode
# bindkey -v

# function zle-line-init zle-keymap-select {
#     RPS1="%{$fg[yellow]%}${${KEYMAP/vicmd/%B Normal Mode %b}/(main|viins)/ }%{$reset_color%}"
#     RPS2=$RPS1
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

# bindkey "^R" history-incremental-search-backward
# bindkey "^[[A" history-beginning-search-backward-end
# bindkey "^[[B" history-beginning-search-forward-end
# bindkey "\e." insert-last-word
# bindkey "\eq" quote-line
# bindkey "\ek" backward-kill-line

# # use the vi navigation keys in menu completion
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# leave insert mode without esc
# bindkey -M viins 'jk' vi-cmd-mode

###############################################################
# => fancy
###############################################################

autoload -Uz compinit
compinit
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# prompt
autoload -U colors && colors

PROMPT="%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%~
%{$reset_color%}\$  "

# left prompt
# PROMPT="%F{237}%K{239}█▓░%{$fg_bold[green]%}%K{239}%n@%m%F{237}%K{239}░▓█%{$reset_color%} %F{237}%K{239}█▓░%{$fg_bold[blue]%}%K{239}%~%F{237}%K{239}░▓█%{$reset_color%}
# \$ "

## right prompt
## RPROMPT="%F{237}%K{239}█▓░%F{248}%K{239}%T%F{237}%K{239}░▓█%{$reset_color%}"

# colored completion suggestions
zstyle ':completion:*:default' list-colors "${(@s.:.)LS_COLORS}"

# complete also incorrect stuff
zstyle ':completion:*' completer _complete _correct _approximate

# edit command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey 'jk' edit-command-line

###############################################################
# => exports
###############################################################

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

###############################################################
# => Aliases
###############################################################
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

###############################################################
# => plugin config
###############################################################

# autosuggestions
bindkey '^j' autosuggest-execute
bindkey '^ ' autosuggest-accept

# history substring search
# bindkey "^[[A" history-substring-search-up
# bindkey "^[[B" history-substring-search-down
# bindkey "^P" history-substring-search-up
# bindkey "^N" history-substring-search-down


###############################################################
# => void only
###############################################################
if [[ `uname -n` = "void" ]]; then
    alias vim=vim-huge-python3
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

###############################################################
# => uni wien only
###############################################################
if [[ `whoami` = "boehm" ]]; then
    export PATH=~/miniconda3/bin:$PATH
fi
