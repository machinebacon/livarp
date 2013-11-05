#!/bin/bash
# ratpoison section

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

# ratpoison stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all ratpoison session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete ratpoison session----------------------------------"
    echo ""
    echo " remove ratpoison system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y ratpoison
    rm /etc/skel/.ratpoisonrc
    rm /etc/skel/bin/start/ratpoison_start.sh
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-ratpoison-session
    rm $HOME/bin/start/ratpoison_start.sh
    rm $HOME/.ratpoisonrc
    rm -R -f $HOME/.ratpoison
    echo ""
    echo -e "${cyan} ratpoison session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
