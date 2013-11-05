#!/bin/bash
##################################
## non-free installation script ##
##------------------------------##
source ~/.bashrc
clear
# are you root ?
# ----------------------------------------------------------------------
if [ "`whoami`" != "root" ]; then
    echo ""
    echo " you're not root..."
    echo " this script needs admin privileges"
    echo "   please launch this script as root."
    sleep 4s && exit 0
fi

# run only once
# ----------------------------------------------------------------------
if [ -e /etc/apt/sources.list.free.bak ]; then
    echo ""
    echo " your system already includes non-free stuff"
    echo ""
    sleep 4s
    exit 0
fi

# intro
# ----------------------------------------------------------------------
echo ""
echo -e "${cyan} welcome to nonfree-stuff install script"
echo -e " ---------------------------------------$NC"
echo ""
echo " this script will : "
echo " - add nonfree archives to Debian repositories"
echo " - add deb-multimedia repository"
echo " - update & upgrade system"
echo " - install flashplugin-nonfree"
echo ""
echo " you need an active internet connection"
echo ""
echo " are you really sure you need nonfree stuff ?"
echo -n " [y|N] : "
read answer
if [ "$answer" = "n" ] || [ "$answer" = "N" ] || [ "$answer" = "" ]; then
    echo ""
    echo " free as in freedom .... GNU/Linux "
    echo ""
    sleep 4s
    exit 0
else
    # internet test
    # ------------------------------------------------------------------
    echo ""
    echo " Testing internet connection..."
    sleep 2s
    echo ""
    IS=`/bin/ping -c 1 ftp.de.debian.org | grep -c "64 bytes"`
    if [ "$IS" -lt "1" ]; then
        until [ "$CONT" != "" ]; do
        echo ""
        IS=`/bin/ping -c 1 ftp.de.debian.org | grep -c "64 bytes"`
        if [ "$IS" -lt "1" ]; then
            clear
            echo "  No internet connection."
            echo ""
            echo "  Configure your internet connection"
            echo "  then hit a key to continue, or hit \"q + Enter\""
            echo "  to quit this script."
            read a
            if [ "$a" = "q" ]; then
                clear
                echo " see you on next login. "
                echo ""
                sleep 2s
                exit 0
            fi
        else
            CONT="pass"
        fi
        done
    fi
    clear
    echo "  internet is yours..."
    echo ""
    # query non-free sources.list
    # ------------------------------------------------------------------
    echo " copy non-free sources.list"
    echo ""
    mv /etc/apt/sources.list /etc/apt/sources.list.free.bak
    cp /usr/share/livarp/sources.list.nonfree /etc/apt/sources.list
    sleep 2s
    # adding deb-multimedia keyring
    # ------------------------------------------------------------------
    echo ""
    echo " adding deb-multimedia keyring"
    echo ""
    sleep 2s
    apt-get update && apt-get install --allow-unauthenticated deb-multimedia-keyring
    # upgrade system
    # ------------------------------------------------------------------
    echo ""
    echo " system update & upgrade"
    echo ""
    sleep 2s
    apt-get dist-upgrade -y --force-yes
    # install flashplugin-nonfree
    # ------------------------------------------------------------------
    echo ""
    echo " installing flashplugin-nonfree"
    echo ""
    sleep 2s
    apt-get --no-install-recommends install flashplugin-nonfree
fi
# end of script
# ----------------------------------------------------------------------
echo ""
echo " nonfree-post-install is finish."
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
