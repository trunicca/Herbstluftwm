#!/bin/bash
#------------------------------------------////
# Lapbox ~/.bashrc file
# Last Modified 20 January 2009
# Running on Debian GNU/Linux - Lenny
#------------------------------------------////
#------------------------------------------////
# Colors:
#------------------------------------------////
black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

#------------------------------------------////
# Proxy:
#------------------------------------------////
#http_proxy=http://127.0.0.1:8118/
#HTTP_PROXY=$http_proxy
#export http_proxy HTTP_PROXY

#------------------------------------------////
# Aliases:
#------------------------------------------////
## make ls list by size
##alias ls='du -s */* | sort -n'
alias findbig='find . -type f -exec ls -s {} \; | sort -n -r | head -5'
alias ping='ping -c 4'
alias search='aptitude search'
alias show='aptitude show'
alias ls='ls -aF --color=always'
alias la='ls -Al'
alias lx='ls -lXB'
alias lk='ls -lSr'
alias lc='ls -lcr'
alias lu='ls -lur'
alias lr='ls -lR'
alias lt='ls -ltr'
alias lm='ls -al |more'
#-----------------------------------------////
##aliases to places on the system
alias desk='cd ~/Desktop'
alias music='cd ~/Music'
alias dlds='cd ~/Downloads'
alias i3='cd ~/.config/i3'
alias herb='cd ~/.config/herbstfluwm'
#-----------------------------------------////
##aliases to edit frequent files
alias auto='sudo vim ~/.config/herbstfluwm/autostart'
alias config='urxvt vim -e ~/.config/i3/config'
#-----------------------------------------////
##still learning 
#alias rm='rm -i'
#----------------------------------------////
##frequent commands
alias up='cd ..'
alias ..='cd ..'
alias fhere="find . -name"
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias git="git clone"
alias 
alias pac='sudo pacman -S'
alias rm='sudo rm -r'
alias syyu='sudo pacman -Syyu'
alias y='yaourt'
alias p='packer'
alias sn='sudo nano'
alias sg='sudo gedit'
alias th='sudo thunar'
alias jam='ncmpcpp'
alias top='htop'
alias gl='glances'
alias chat='weechat'
alias dld='rtorrent'
alias doc='ranger'
alias cdl='function cdl { cd $1; ls;}'
#alias ch='chmod +x'
#alias cl='clear'
alias b='bash'
#----------------------------------------////
##
#------------------------------------------////
# Functions and Scripts:
#------------------------------------------////
localnet ()
{
/sbin/ifconfig | awk /'inet addr/ {print $2}' 
echo ""
/sbin/ifconfig | awk /'Bcast/ {print $3}' 
echo ""
}
myip ()
{
lynx -dump -hiddenlinks=ignore -nolist [url]http://checkip.dyndns.org:8245/[/url] | grep "Current IP Address" | cut -d":" -f2 | cut -d" " -f2
}
upinfo ()
{
echo -ne "${green}$HOSTNAME ${red}uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}
cd() 
{
  if [ -n "$1" ]; then
    builtin cd "$@" && ls
  else
    builtin cd ~ && ls
  fi
}
weather ()
{
declare -a WEATHERARRAY
WEATHERARRAY=( `lynx -dump "[url]http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla_en-US_official&q=weather+${1}&btnG=Search[/url]" | grep -A 5 -m 1 "Weather for" | sed 's;\[26\]Add to iGoogle\[27\]IMG;;g'`)
echo ${WEATHERARRAY[@]}
}

encrypt ()
{
gpg -ac --no-options "$1"
}

decrypt ()
{
gpg --no-options "$1"
}

extract()
{
if [ -f "$1" ] ; then
case "$1" in
*.tar.bz2) tar xjf "$1" ;;
*.tar.gz) tar xzf "$1" ;;
*.tar.Z) tar xzf "$1" ;;
*.bz2) bunzip2 "$1" ;;
*.rar) unrar x "$1" ;;
*.gz) gunzip "$1" ;;
*.jar) unzip "$1" ;;
*.tar) tar xf "$1" ;;
*.tbz2) tar xjf "$1" ;;
*.tgz) tar xzf "$1" ;;
*.zip) unzip "$1" ;;
*.Z) uncompress "$1" ;;
*) echo "'$1' cannot be extracted." ;;
esac
else
echo "'$1' is not a file."
fi
}
#------------------------------------------////
# Some original .bashrc contents:
#------------------------------------------////
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#------------------------------------------////
# Prompt:
#------------------------------------------////


PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\]:\[\033[00m\]'

#------------------------------------------////
# System Information:
#------------------------------------------////
clear
echo -e "${LIGHTGRAY}";figlet "Trapaholic";
echo -ne "${red}Today is:\t\t${cyan}" `date`; echo ""
echo -e "${red}Kernel Information: \t${cyan}" `uname -smr`
echo -ne "${cyan}";upinfo;echo ""
echo -e "${cyan}"; cal -3
