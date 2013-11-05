#!/bin/bash
##########################################
## power-management installation script ##
##--------------------------------------##
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
echo -e "${cyan} welcome to power-management install script"
echo -e " ------------------------------------------$NC"
echo ""
echo " this script will : "
echo " - install xfce4-power-manager"
echo " - install laptop-detect"
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
                echo " see you... "
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
    # system update & power-saver installation
    # ------------------------------------------------------------------
    echo " system update & power-manager installation"
    echo ""
    sleep 2s
    apt-get update
    apt-get install -y xfce4-power-manager laptop-detect
fi
# end of script
# ----------------------------------------------------------------------
clear
echo ""
echo " power-manager is installed."
echo " congrats !!"
echo ""
echo " to enable power-manager, don't forget to "
echo " uncomment the power-line in your ~/.xinitrc"
echo ""
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
