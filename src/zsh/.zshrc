# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# add zsh plugins
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# aliases
alias ls='ls -AGhp --color=auto'
alias ll='ls -AlFGhp --color=auto'

alias path='echo -e ${PATH//:/\\n}'
alias reload='exec $SHELL -l'

alias fc='fc() { find $1 -type f 2> /dev/null | wc -l };fc'

# apt update/upgrade/clean-up
alias aptup='sudo sh -c "apt-get -y update;apt-get -y dist-upgrade;apt-get -y autoremove;apt-get -y autoclean"'

# docker aliases
alias dl='docker ps -a'
alias dockerup='cd /optd/docker; docker-compose pull; docker-compose up -d'
alias drm='docker rm $(docker ps -aq)'
alias ds='docker stop $(docker ps -aq)'
alias dclean='docker stop `docker ps -qa` && docker rm `docker ps -qa` && docker rmi -f `docker images -qa ` && docker volume rm $(docker volume ls -qf) && docker network
 rm `docker network ls -q`'
alias de='de() { docker exec -it $1 ${2:-bash} };de'
alias df='df() { docker logs -f $1 };df'

# grep aliases
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# lscolor hack for 777 files/directories
LS_COLORS=$LS_COLORS:'ow=1;37:' ; export LS_COLORS