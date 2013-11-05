#!/bin/bash
# pekwm section

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

# pekwm stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all pekwm session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete pekwm session--------------------------------------"
    echo ""
    echo " remove pekwm system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y pekwm
    rm -R -f /usr/share/pekwm
    rm /usr/local/bin/pekwm_keys.sh
    rm -R -f /etc/skel/.pekwm
    rm /etc/skel/bin/start/pekwm_start.sh
    rm /etc/skel/.conky/conkyrc_pekwm
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-pekwm-session
    rm $HOME/bin/start/pekwm_start.sh
    rm -R -f $HOME/.pekwm
    rm $HOME/.conky/conkyrc_pekwm
    echo ""
    echo -e "${cyan} pekwm session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
