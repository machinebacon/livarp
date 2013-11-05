#!/bin/bash
#################################
## spacefm installation script ##
##-----------------------------##
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
echo -e " ${cyan}welcome to spacefm install script"
echo -e " ---------------------------------$NC"
echo ""
echo " this script will : "
echo " - install spacefm : a powerfull file-manager that can split into 4 frames"
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
    # get spacefm
    # ------------------------------------------------------------------
    echo ""
    echo " spacefm download"
    echo ""
    sleep 2s
    cd /tmp
    wget http://arpinux.org/debian/spacefm_0.8.7-1_all.deb
    echo ""
    echo " spacefm installation"
    echo ""
    sleep 2s
    gdebi-gtk spacefm_0.8.7-1_all.deb
    echo ""
    echo " cleaning"
    echo ""
    rm /tmp/spacefm_0.8.7-1_all.deb
fi
# end of script
# ----------------------------------------------------------------------
echo ""
echo " spacefm is installed."
echo " congrats !!"
echo ""
echo " you can use a \"tiling file-manager\" on any session now :)"
echo ""
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
