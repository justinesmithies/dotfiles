#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source <(kitty + complete setup bash)

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim='vimargs'
alias ssh='kitty +kitten ssh'
alias yay='yay --color=auto'
alias ranger='ranger-fix'
alias cat='bat --paging=never' 
alias ls='lsd'

#PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u@\h \w]\\$ \[$(tput sgr0)\]"
export EDITOR=nvim
export PATH=$PATH:~/.local/bin

vimargs() {
    #do things with parameters like $1 such as
   (kitty --class vim -e nvim $@ & ) > /dev/null 2>&1
}

# startx if on matching VT

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
