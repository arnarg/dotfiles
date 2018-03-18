#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
# PS1='[\u@\h \W]\$ '
PS1='\e[0;31m\u:\e[m \W \n>> '

# Writes how many days since pacman -Suy was run
echo "Days since last update:" $(echo "( $(date +%s -u) - $(date +%s -u -d "$(awk '/pacman -Suy/ {print $1" "$2}' /var/log/pacman.log | tail -n 1 | cut -c 2-17)") )/ 86400" | bc)

# histcontrol
export HISTCONTROL=ignoreboth

# default editor
export EDITOR=vim

# enable notes app
. ~/.notes.sh
