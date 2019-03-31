bindkey -e
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY

autoload -U compinit
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
