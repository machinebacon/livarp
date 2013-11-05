#!/bin/bash
# openbox section

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

# openbox stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all openbox session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete openbox session------------------------------------"
    echo ""
    echo " remove openbox system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y openbox obconf obmenu
    rm -R -f /etc/skel/.config/openbox
    rm /etc/skel/.conky/conkyrc_openbox
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-openbox-session
    rm -R -f $HOME/.config/openbox
    rm $HOME/.conky/conkyrc_openbox
    echo ""
    echo -e "${cyan} openbox session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
