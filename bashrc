#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -l'

# $user: ~
# >> 
PS1='\e[0;31m\u:\e[m \W \n>> '

# histcontrol
export HISTCONTROL=ignoreboth

# default editor
export EDITOR=vim
