# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# colors & char ########################################################
# text normal colors
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
green='\e[0;32m'
yellow='\e[0;33m'
# text bright colors
bred='\e[0;91m'
bblue='\e[0;94m'
bcyan='\e[0;96m'
bgreen='\e[0;92m'
byellow='\e[0;93m'
bwhite='\e[0;97m'
# reset color
NC='\e[0m'

# alias ################################################################
# ls & grep ------------------------------------------------------------
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
# cd & goto ------------------------------------------------------------
alias cd..='cd ..'
alias ...='cd ..'
alias ....='cd ../..'
alias gm='cd /media'
alias gc='cd ~/.config'
alias gb='cd ~/bin'
# apps -----------------------------------------------------------------
# agenda/todo list
alias agenda='urxvtcd -T agenda -e calcurse'
# may the force be with you
alias starwars="telnet towel.blinkenlights.nl"
# utils ----------------------------------------------------------------
# get top 10 shell commands:
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
# process using web
alias ports='lsof -i -n -P'
# last modified files and folders
alias mod60="find /home/$USER/ -path /home/$USER/.thumbnails -prune -o -path /home/$USER/.mozilla -prune -o -mmin -60"
alias modd="find /home/$USER/ -path /home/$USER/.thumbnails -prune -o -path /home/$USER/.mozilla -prune -o -mtime -1"
# make parent directory if needed
alias mkdir='mkdir -p'
# packages -------------------------------------------------------------
alias debup='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get clean'
alias debsh='apt-cache search'
alias debvs='apt-cache policy'
alias debcl='sudo apt-get clean'
alias debin='sudo apt-get --no-install-recommends install'
alias debrm='sudo apt-get autoremove --purge'
alias debgui='gksudo synaptic'
# quit, exit & reboot --------------------------------------------------
alias :q='exit'
alias oust='echo "bye $USER..."; sleep 2s && sudo shutdown -h now'
alias comeback='echo "be back right now..."; sleep 2s && sudo shutdown -r now'
# bash cfg -------------------------------------------------------------
alias bcfg='vim ~/.bashrc'
alias brld='source ~/.bashrc'
# end of alias #########################################################

# functions ############################################################
# misc -----------------------------------------------------------------
# find from name in current directory
function ff() { find . -type f -iname '*'$*'*' -ls ; }
# generate a dated .bak from file
function bak() { cp $1 $1_`date +%Y-%m-%d_%H:%M:%S`.bak ; }
# minical
function today() { echo -n "Today's date is:\n"; date +"%A, %B %-d, %Y"; }
# infos ----------------------------------------------------------------
# generate space report
function space() { du -skh * | sort -hr ; }
# disk usage
function dduse() { echo -e " `df -h | grep 'rootfs  ' | awk '{print $5}'` used -- `df -h | grep 'rootfs  ' | awk '{print $4}'` free"; }
# mem usage
function mmuse() { echo -e " `free -m | grep buffers/cache | awk '{print $3}'`M used -- `free -m | grep buffers/cache | awk '{print $4}'`M free"; }
# processes
function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }
# hardware -------------------------------------------------------------
# processor
function core() { cat /proc/cpuinfo | grep "model name" | cut -c14- ; }
# graphic card
function graph() { lspci | grep -i vga | cut -d: -f3 ; }
# ethernet card
function ethcard() { lspci | grep -i ethernet | cut -d: -f3 ; }
# wireless card
function wfcard() { lspci | grep -i network | cut -d: -f3 ; }
# public ip address ----------------------------------------------------
function my_eip()
{
    if [ "$(cat /sys/class/net/eth0/operstate)" = "up" ] || [ "$(cat /sys/class/net/eth1/operstate)" = "up" ] || [ "$(cat /sys/class/net/wlan0/operstate)" = "up" ];then
        MY_EXIP=$(wget -q -O - checkip.dyndns.org | sed -e 's/[^[:digit:]\|.]//g')
    else
        MY_EXIP=$(echo "not connected")
    fi
    # output
    echo -e " $MY_EXIP"
}
# infobox --------------------------------------------------------------
function ii()
{
    echo
    echo -e ""
    echo -e "${cyan}   livarp_0.4 Debian InfoBox"
    echo -e "   -------------------------$NC"
    echo -e "${blue} agenda$NC"
    echo -e " `date +'%A, %B %-d, %Y -- %I:%M %P'`"
    echo -e "${blue} processor information$NC"
    echo -e " `core`"
    echo -e "${blue} graphic information$NC"
    echo -e "`graph`"
    echo -e "${blue} ethernet information$NC"
    echo -e "`ethcard`"
    echo -e "${blue} wireless information$NC"
    echo -e "`wfcard`"
    echo ""
    echo -e "${yellow} kernel information$NC"
    echo -e " `uname -a`"
    echo -e "${yellow} machine stats$NC"
    echo -e "`uptime`"
    echo -e "${yellow} memory stats$NC"
    echo -e "`mmuse`"
    echo -e "${yellow} disk stats$NC"
    echo -e "`dduse`"
    echo -e "${yellow} external IP address$NC"
    echo -e "`my_eip`"
    echo -e ""
    echo -e "${blue} if R.Stallman was here...$NC"
    echo -e "`vrms`"
    echo ""
}
# archives -------------------------------------------------------------
# extract
function extract()      
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *.xz)        unxz $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
# compress
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
mktxz() { tar cvJf "${1%%/}.tar.xz" "${1%%/}/"; }
# end of functions #####################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# prompt ###############################################################
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # uncomment for 'livarp' prompt
    #echo -en "\e[1;37mlivarp\e[m0.4\e[0;32mGNU/Linux\e[01;34mDebian\e[m\n"
    PS1='${debian_chroot:+($debian_chroot)} \e[01;32m\u\e[m@\e[0;36m\h\e[m \e[01;34m\w\e[m\n $ '
    # uncomment for a guantas_style prompt. sources: http://crunchbang.org/forums/viewtopic.php?pid=277970#p277970
    #PS1="\[\e[00;32m\]\A \[\e[00;35m\]\[\e[00;37m\]\n\[\e[00;35m\]●\[\e[00;33m\] ●\[\e[00;31m\] ●\[\e[01;35m\]\[\e[0m\] "
    # regular Debian colored prompt:
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR="vim"
export BROWSER="firefox"
export PAGER="most"
