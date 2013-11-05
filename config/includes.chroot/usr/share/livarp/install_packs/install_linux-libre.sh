#!/bin/bash
#####################################
## linux-libre installation script ##
##---------------------------------##
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
if [ -e /usr/share/livarp/livarpfree ]; then
    echo ""
    echo " your system already includes linux-libre kernel"
    echo ""
    sleep 4s && exit 0
fi

# intro
# ----------------------------------------------------------------------
echo ""
echo -e "${cyan} welcome to linux-libre install script"
echo -e " -------------------------------------$NC"
echo ""
echo " this script will : "
echo " - add jxself repository to Debian repositories"
echo " - install linux-libre kernel"
echo ""
echo " you need an active internet connection"
echo ""
echo " more info <http://jxself.org/linux-libre/>"
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
    # adding new repo to sources.list
    # ------------------------------------------------------------------
    echo " adding jxself repo to sources.list"
    echo ""
    touch /etc/apt/sources.list.d/libre-kernel.list
    echo "# linux-libre #" >> /etc/apt/sources.list.d/libre-kernel.list
    echo "deb http://linux-libre.fsfla.org/pub/linux-libre/freesh/ freesh main" >> /etc/apt/sources.list.d/libre-kernel.list
    sleep 2s
    # adding jxself keyring
    # ------------------------------------------------------------------
    echo " adding jxself keyring"
    echo ""
    wget http://linux-libre.fsfla.org/pub/linux-libre/freesh/archive-key.asc
    apt-key add archive-key.asc 
    rm archive-key.asc 
    sleep 2s
    # system update
    # ------------------------------------------------------------------
    echo " system update"
    echo ""
    sleep 2s
    apt-get update
    # install linux-libre
    # ------------------------------------------------------------------
    echo " installing linux-libre headers & kernel"
    echo ""
    sleep 2s
    apt-get install -y linux-libre32-headers linux-libre32
fi
# end of script
# ----------------------------------------------------------------------
echo "linux libre kernel installed - do not remove" > /usr/share/livarp/livarpfree
echo ""
echo " latest linux-libre kernel is installed."
echo " congrats !!"
echo ""
echo " you can reboot on a 100% free kernel now :)"
echo ""
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
