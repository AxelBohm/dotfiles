bindkey -e
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY

# use z installed from package manager
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

## conda 
# tab completion for conda
fpath+=~/.zsh/conda-zsh-completion

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
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

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
elif [[ `uname -n` = "raspberrypi" ]]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ `uname -n` = "dlrig" ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ `uname -n` = "login.mat.univie.ac.at" ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# colemak remaps
source ~/.zsh/colemak.zsh

################################################################
## pip zsh completion start
################################################################
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

bindkey -s '^O' 'ranger\n'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/xel/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/xel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/xel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/xel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
