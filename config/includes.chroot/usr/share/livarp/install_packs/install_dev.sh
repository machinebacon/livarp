#!/bin/bash
#############################
## dev installation script ##
##-------------------------##
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

# intro
# ----------------------------------------------------------------------
echo ""
echo -e "${cyan} welcome to dev-pack install script"
echo -e " ----------------------------------$NC"
echo ""
echo " this script will : "
echo " - install git"
echo " - install all tools needed to compile dwm or wmfs"
echo ""
echo " you need an active internet connection"
echo ""
echo -n " continue ? [Y|n] : "
read answer
if [ "$answer" = "n" ] || [ "$answer" = "N" ]; then
    echo ""
    echo " bye $USER "
    echo ""
    sleep 2s
    exit 0
else
    # internet test
    # ------------------------------------------------------------------
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
    # system update & dev installation
    # ------------------------------------------------------------------
    echo " system update & dev-pack installation"
    echo ""
    sleep 2s
    apt-get update
    apt-get install -y build-essential git-core libimlib2-dev libx11-dev libxinerama-dev autoconf automake libxft-dev
fi
# end of script
# ----------------------------------------------------------------------
echo ""
echo " dev-pack is installed."
echo " congrats !!"
echo ""
echo " you can configure and compile from sources now :)"
echo ""
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
