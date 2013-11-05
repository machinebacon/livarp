#!/bin/bash
# fluxbox section

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

# fluxbox stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all fluxbox session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete fluxbox session------------------------------------"
    echo ""
    echo " remove fluxbox system files."
    echo ""
    sleep 2s
    apt-get autoremove -y fluxbox
    rm -R -f /usr/share/fluxbox
    rm -R -f /usr/local/bin/fluxmenu_datas
    rm /usr/local/bin/fluxmenu
    rm -R -f /etc/skel/.fluxbox
    rm /etc/skel/bin/start/fluxbox_start.sh
    rm /etc/skel/.conky/conkyrc_fluxbox
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-fluxbox-session
    rm $HOME/bin/start/fluxbox_start.sh
    rm -R -f $HOME/.fluxbox
    rm $HOME/.conky/conkyrc_fluxbox
    echo ""
    echo -e "${cyan} fluxbox session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
