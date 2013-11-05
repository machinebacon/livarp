#!/bin/bash
# dwm section

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

# dwm stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all dwm & dwm_reloaded session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete dwm session----------------------------------------"
    echo ""
    echo " remove dwm system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y dwm
    rm /usr/local/bin/dwm
    rm /usr/local/bin/dwm_keys.sh
    rm /etc/skel/.conky/conkyrc_dwm
    rm /etc/skel/bin/start/dwm_start.sh
    rm /usr/share/livarp/sources/dwm_reloaded_l4.tgz
    echo ""
    echo " remove startup script and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-dwm-session
    rm $HOME/bin/start/dwm_start.sh
    rm $HOME/.conky/conkyrc_dwm
    echo ""
    echo -e "${cyan} dwm session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
