#!/bin/bash
# wmfs section

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

# wmfs stuff
# ----------------------------------------------------------------------
echo ""
echo ""
echo -e "${red} you're about to remove all wmfs session files"
echo -en " do you want to continue ? [Y|n]$NC "
read a
if [ "$a" = "n" ] || [ "$a" = "N" ]; then
    echo ""
    echo "script aborted"
    sleep 4s && exit 0
else
    echo ""
    echo " ---delete wmfs session---------------------------------------"
    echo ""
    echo " remove wmfs system files."
    echo ""
    sleep 2s
    rm /usr/local/bin/wmfs
    rm /usr/local/bin/shortcuts_help.sh
    rm /usr/local/bin/keybind_help.sh
    rm /usr/share/applications/wmfs.desktop
    rm /usr/share/man/man1/wmfs.1
    rm -R -f /etc/xdg/wmfs
    rm -R -f /etc/skel/.config/wmfs
    rm /etc/skel/.conky/conkyrc_wmfs
    rm /etc/skel/.conky/conkyrc_wmfs_launchers
    rm /etc/skel/bin/start/wmfs_start.sh
    rm /usr/share/livarp/sources/wmfs-master.zip
    echo ""
    echo " remove startup script, config and conky."
    echo ""
    sleep 2s
    rm $HOME/bin/remove-sessions/rm-wmfs-session
    rm $HOME/bin/start/wmfs_start.sh
    rm -R -f $HOME/.config/wmfs
    rm $HOME/.conky/conkyrc_wmfs
    rm $HOME/.conky/conkyrc_wmfs_launchers
    echo ""
    echo -e "${cyan} wmfs session removed$NC "
    echo ""
    sleep 2s
fi
#eof--------------------------------------------------------------------
