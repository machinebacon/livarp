#!/bin/bash
# spectrwm section

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

# spectrwm stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all spectrwm session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete spectrwm session-----------------------------------"
    echo ""
    echo " remove spectrwm system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y spectrwm
    rm /usr/local/bin/spectrwm_keys.sh
    rm -R -f /etc/skel/.spectrwm.conf
    rm /etc/skel/bin/start/spectrwm_start.sh
    rm /etc/skel/bin/spectrwm_status.sh
    echo ""
    echo " remove startup script, config and script."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-spectrwm-session
    rm $HOME/bin/start/spectrwm_start.sh
    rm $HOME/.spectrwm.conf
    rm $HOME/bin/spectrwm_status.sh
    echo ""
    echo -e "${cyan} spectrwm session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
