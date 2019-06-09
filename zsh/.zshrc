bindkey -e
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY

# use z installed from package manager
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

###############################################################
# => fancy
###############################################################

autoload -Uz compinit
compinit
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# colored completion suggestions
zstyle ':completion:*:default' list-colors "${(@s.:.)LS_COLORS}"

## complete also incorrect stuff
zstyle ':completion:*' completer _complete _correct _approximate

## edit command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey 'jk' edit-command-line

# search for already written text by pressing up/down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

###############################################################
# => prompt
###############################################################
#
autoload -U colors && colors

# git prompt
source ~/.zsh/git.zsh

# vi settings for zsh
source ~/.zsh/vi.zsh

PROMPT='%{$fg[green]%}%n@%m %{$fg[blue]%}%~ $(git_prompt_string)
%{$reset_color%}\$ '

# left prompt
# PROMPT="%F{237}%K{239}█▓░%{$fg_bold[green]%}%K{239}%n@%m%F{237}%K{239}░▓█%{$reset_color%} %F{237}%K{239}█▓░%{$fg_bold[blue]%}%K{239}%~%F{237}%K{239}░▓█%{$reset_color%}
# \$ "

## right prompt
## RPROMPT="%F{237}%K{239}█▓░%F{248}%K{239}%T%F{237}%K{239}░▓█%{$reset_color%}"

################################################################
## => Aliases
################################################################
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

################################################################
## => plugin config
################################################################

## autosuggestions
bindkey '^j' autosuggest-execute
bindkey '^ ' autosuggest-accept

## history substring search
## bindkey "^P" history-substring-search-up
## bindkey "^N" history-substring-search-down

################################################################
## => functions
################################################################
function mdl {
    youtube-dl --extract-audio --audio-format mp3 "$1"
}

################################################################
## => void only
################################################################
if [[ `uname -n` = "void" ]]; then
    alias vim=vim-huge-python3
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

################################################################
## => uni wien only
################################################################
if [[ `whoami` = "boehm" ]]; then
    export PATH=~/miniconda3/bin:$PATH
fi
