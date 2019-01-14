# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="bira"

# Which plugins would you like to load? 
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions 
  history-substring-search
)

###############################################################
# => exports
###############################################################

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# put the scripts in the path
export PATH=~/bin:$PATH
export PATH=~/bin/xrandr:$PATH

# needed for pythons pip --user
export PATH=~/.local/bin:$PATH

# set editor
export VISUAL=vim
export EDITOR="$VISUAL"

# prompt
source ~/bin/fancy_prompt.rc

###############################################################
# => misc
###############################################################

# vim mode in CL
bindkey -v  
# but keep some emacs behaviour
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

###############################################################
# => Aliases
###############################################################
alias gc="git commit"
alias ga="git add"
alias gap="git add -p"
alias gs="git status"
alias gd="git diff"
alias gp="git push"
alias gca="git commit --amend"
alias gco="git checkout"
# store credentials
alias gsc="git config credential.helper store"

alias sai="sudo apt install"
alias pi="sudo pacman -S"
alias pr="sudo pacman -R"

alias v="vim"
alias vrc="vim ~/.vim/vimrc"
alias zrc="vim ~/.zshrc"
alias mrc="vim ~/.config/mutt/muttrc"
alias arc="vim ~/.config/mutt/etc/aliases"
alias nrc="vim ~/.newsboat/config"
alias rrc="vim ~/.config/ranger/rc.conf"

alias R="R --quiet --no-save"
alias t="tmux"
alias r="ranger"
alias s="startx"

# who can remember this command !?
alias chterm="sudo update-alternatives --config x-terminal-emulator"

# starwars in ascii
alias starwars="telnet towel.blinkenlights.nl"

# Custom cd
c() {
	cd $1;
    ls;
}
alias cd="c"

alias la="ls -A"

###############################################################
# => colored man pages
###############################################################
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

###############################################################
# => plugin config
###############################################################

# autosuggestions
bindkey '^s' autosuggest-execute
bindkey '^ ' autosuggest-accept

# history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

# keyboard stuff
if [[ `ps -e | grep X` ]]; then
    xset r rate 180 70
    setxkbmap -option ctrl:nocaps
    setxkbmap -option ctrl:ralt_rctrl
    # xmodmap -e "keycode 64 = Escape"
fi


###############################################################
# => uni wien only
###############################################################
if [[ `whoami` = "boehm" ]]; then
    export PATH=~/miniconda3/bin:$PATH
fi
