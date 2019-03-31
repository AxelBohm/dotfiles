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
compinit
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
# colored completion suggestions
zstyle ':completion:*:default' list-colors "${(@s.:.)LS_COLORS}"

###############################################################
# => exports
###############################################################

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh
# source $ZSH/oh-my-zsh.sh

# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# prompt
# source ~/bin/fancy_prompt.rc
PROMPT='[%F{green}%n%f@%F{blue}%m%f %F{yellow}%1~%f]%# '


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
bindkey '^s' autosuggest-execute
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
else;
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

###############################################################
# => uni wien only
###############################################################
if [[ `whoami` = "boehm" ]]; then
    export PATH=~/miniconda3/bin:$PATH
fi
