# Path to oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

# Turn off oh-my-zsh update prompt
DISABLE_UPDATE_PROMPT=true

# Turn off autocorrect
DISABLE_CORRECTION=true

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="af-magic"

source $ZSH/oh-my-zsh.sh

#<<< Options
setopt AUTO_CD
setopt NO_BEEP
#>>>

#<<< Aliases
alias zshconfig="emacs ~/.zshrc"
alias ohmyzsh="emacs ~/.oh-my-zsh"
#cmdline helpers
alias df="df -H"
alias ls="ls --color"
alias ll="ls -lsai --color"
alias ...="cd ../../../"
alias ....="cd ../../../../"
#apt-get stuff
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"
#networking helpers
alias cpv="rsync -pogh --progress"
alias rnet="sudo restart networking"
alias ports="netstat -tulanp"
#laptop (vaio) stuff
alias bl="xrandr --output LVDS1 --brightness"
alias kbbl0="sudo sh -c 'echo 0 > /sys/devices/platform/sony-laptop/kbd_backlight'"
alias kbbl1="sudo sh -c 'echo 1 > /sys/devices/platform/sony-laptop/kbd_backlight'"
#>>>

#<<< Functions
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
#>>>

#<<< Rebindings
bindkey '\e[3~' delete-char
bindkey "^[s" insert-sudo
#>>>

#<<< History
HISTFILE=~/.zsh-history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
#>>>

#<<< Plugins
plugins=(git history-substring-search safe-paste)
#>>>

#<<< PATH
export PATH=/usr/local/sbin:/usr/local/bin:/opt/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
#>>>

#<<< PROMPT
local smiley="%(?,%{$fg[green]%}:)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
PROMPT='%B%t%b $FG[032]%0~ %{$reset_color%}${smiley} '
#>>>

#<<< Startup
export TERM=xterm-256color
fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
#>>>
