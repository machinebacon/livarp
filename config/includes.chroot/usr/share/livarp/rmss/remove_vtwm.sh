#!/bin/bash
# vtwm section

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

# vtwm stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all vtwm session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete vtwm session---------------------------------------"
    echo ""
    echo " remove vtwm system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y vtwm
    rm /usr/local/bin/vtwm_keys.sh
    rm -R -f /etc/skel/.vtwmrc
    rm /etc/skel/bin/start/vtwm_start.sh
    rm /etc/skel/.conky/conkyrc_vtwm
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-vtwm-session
    rm $HOME/bin/start/vtwm_start.sh
    rm $HOME/.vtwmrc
    rm $HOME/.conky/conkyrc_vtwm
    echo ""
    echo -e "${cyan} vtwm session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
