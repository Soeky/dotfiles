#
# ~/.bashrc
#

# this bashrc is my own and inspired by mischavandenburg and rwxrob

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to vi editor mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

#~~~~~~~~~~~~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export VISUAL=nvim
export EDITOR=nvim

# config
export BROWSER="chromium"

# directories
export REPOS="$HOME/repos"
export GITUSER="Soeky"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export DEV="$GHREPOS/dev"
export SCRIPTS="$DOTFILES/scripts"
export NOTES="$GHREPOS/notes"
export XDG_CONFIG_HOME="$HOME"/.config

PATH="${PATH:+${PATH}:}"$SCRIPTS":"$HOME"/.local/bin"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

#~~~~~~~~~~~~~~~~~~~~~~~~~~~ FOR GO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export LOG_FILES="$HOME/logs"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~ Flutter ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export ANDROID_HOME=~/Android/Sdk
export CHROME_EXECUTABLE=/usr/bin/chromium
PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH="~/repos/github.com/Soeky/dev/flutter/bin/:$PATH"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

clone() {
  local repo="$1" user
  local repo="${repo#https://github.com/}"
  local repo="${repo#git@github.com:}"
  if [[ $repo =~ / ]]; then
    user="${repo%%/*}"
  else
    user="$GITUSER"
    [[ -z "$user" ]] && user="$USER"
  fi
  local name="${repo##*/}"
  local userd="$REPOS/github.com/$user"
  local path="$userd/$name"
  [[ -d "$path" ]] && cd "$path" && return
  mkdir -p "$userd"
  cd "$userd"
  echo gh repo clone "$user/$name" -- --recurse-submodule
  gh repo clone "$user/$name" -- --recurse-submodule
  cd "$name"
} && export -f clone


#~~~~~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias ls="ls --color=auto"
alias ll="ls -la --color=auto"
alias la='ls -lathr'
alias grep="grep --color=auto"
alias v="nvim"
alias ..="cd .."
alias v.="nvim ."
alias sd="shutdown now"
alias ...="cd /home/seymen/"

#~~~~~~~~~~~~~~~~~~~~~~~~~ UNI ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias pgdp="cd $DEV/3cs/pgdp/"
alias itsec="cd $DEV/3cs/itsec/"
alias gbs="cd $DEV/3cs/gbs/"
alias grnvs="cd $DEV/4cs/grnvs/"

# Repos
alias dev='cd $DEV'
alias dot='cd $GHREPOS/dotfiles'
alias repos='cd $REPOS'
alias ghrepos='cd $GHREPOS'
alias rwdot='cd $REPOS/github.com/rwxrob/dot'
alias scripts='cd $GHREPOS/dotfiles/scripts'
alias yltm='cd $GHREPOS/yltm.io/'
alias comp='cd $GHREPOS/cp/'
alias aoc='cd $GHREPOS/aoc/'
alias gendev='cd $GHREPOS/gendev/'
alias notes='cd $NOTES'

alias c="clear"
alias rob='cd $REPOS/github.com/rwxrob'


alias sv='sudoedit'
alias t='tmux'
alias e='exit'
alias syu='sudo pacman -Syu'

# git 
alias gp='git pull'
alias gs='git status'


alias eb='v ~/.bashrc'
alias ev='v ~/.config/nvim/init.lua'
alias sbr='source ~/.bashrc'


# pomo aliases
alias focus='pomo start fokus'
alias focusp='pomo break 5m'
alias focushour='pomo start 1h fokus'
alias lp='pomo break 15m'

# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fp)'

# Farben
# Git-Prompt-Optionen
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"
# export GIT_PS1_SHOWUPSTREAM="auto git"


# git-prompt.sh einbinden
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

# Farben und Prompt-Konfiguration
PROMPT_COMMAND='__git_ps1 "\[\e[33m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]" " \n$ "'

# Bash Completion aktivieren
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Autocompletion für Aliase aktivieren
shopt -s progcomp

# Git Autocompletion
if [ -f /usr/share/git/completion/git-completion.bash ]; then
    . /usr/share/git/completion/git-completion.bash
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Bash-Syntax-Hervorhebung
# source ~/.bash-syntax-highlighting/bash_completion
# Fuzzy completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
