#!/bin/bash
# awesome section

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

# awesome stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all awesome session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete awesome session------------------------------------"
    echo ""
    echo " remove awesome system files."
    echo ""
    sleep 2s
    apt-get autoremove --purge -y awesome awesome-extra
    rm /etc/skel/.conky/conkyrc_awesome
    rm /etc/skel/bin/start/awesome_start.sh
    rm -R -f /etc/skel/.config/awesome
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/start/awesome_start.sh
    rm $HOME/bin/remove-sessions/rm-awesome-session
    rm $HOME/.conky/conkyrc_awesome
    rm -R -f $HOME/.config/awesome
    echo ""
    echo -e "${cyan} awesome session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
