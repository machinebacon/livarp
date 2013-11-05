#!/bin/bash
# evilwm section

source ~/.bashrc
# this script is not available in live-session
# ----------------------------------------------------------------------
if [ -d /home/human ]; then
    echo "this script is not available in live session" | dzen2 -x 0 -y 0 -fg 'white' -p 5 &
    exit
fi

# are you root ?
# ----------------------------------------------------------------------
if [ "`whoami`" != "root" ]; then
    echo "this script need admin power - launch it as root" | dzen2 -x 0 -y 0 -fg 'white' -p 5 &
    exit
fi

# evil stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all evilwm session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete evilwm session-------------------------------------"
    echo ""
    echo " remove evilwm system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y evilwm
    rm /usr/local/bin/evil_keys.sh
    rm /etc/skel/bin/start/evilwm_start.sh
    rm /etc/skel/.conky/conkyrc_evil
    echo ""
    echo " remove startup script and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-evilwm-session
    rm $HOME/bin/start/evilwm_start.sh
    rm $HOME/.conky/conkyrc_evil
    echo ""
    echo -e "${cyan} evilwm session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
