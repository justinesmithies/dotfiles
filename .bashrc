#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

source <(kitty + complete setup bash)

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB':menu-complete

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

# Colour autocomplete suggestions
bind "set colored-stats on"

# If bpytop is installed then alias top to bpytop 
[ -e /usr/bin/bpytop ] && alias top="/usr/bin/bpytop"
alias ls='ls --color=auto -hv --group-directories-first'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Only use aliases according to the TERM we are in
case $TERM in
  xterm*|konsole*)
    alias vim='vimargs';
    alias weechat='weechatargs';
    alias newsboat='newsboatargs';
    alias ssh='kitty +kitten ssh';
    alias nvim="vim";
    alias ranger='ranger-fix';;
  linux)
    alias vim="nvim";;
  *)
esac

command -v bat > /dev/null && alias cat='bat --paging=never' 
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u@\h \w]\\$ \[$(tput sgr0)\]"
export EDITOR="nvim"
export PATH=$PATH:~/.local/bin
export STARSHIP_CONFIG=~/.config/starship/config.toml
export BROWSER="qutebrowser"
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

vimargs() {
    #do things with parameters like $1 such as
   (kitty --class vim -e nvim "$@" & ) > /dev/null 2>&1
}

weechatargs() {
      #do things with parameters like $1 such as
     (kitty --class weechat -e weechat "$@" & ) > /dev/null 2>&1
  }

newsboatargs() {
    #do things with parameters like $1 such as  
  (kitty --class newsboat -e newsboat "$@" & ) > /dev/null 2>&1 
}

# startx if on matching VT
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# If not in xterm don't start starship
case $TERM in
  xterm*|konsole*)
    eval "$(starship init bash)";;
  *)
esac

