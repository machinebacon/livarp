#!/bin/bash
##############################
## lamp installation script ##
##--------------------------##
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
echo -e "${cyan} welcome to linux-lamp install script"
echo -e " -------------------------------------$NC"
echo ""
echo " this script will : "
echo " - install apache2 webserver"
echo " - install php5"
echo " - install MySQl"
echo " - install phpmyadmin"
echo " - and dependancies..."
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
    # system update & lamp installation
    # ------------------------------------------------------------------
    echo " system update & lamp installation"
    echo ""
    sleep 2s
    apt-get update
    apt-get install -y apache2 mysql-server php5 php-pear php5-gd php5-mysql php5-imagick php5-curl phpmyadmin rsync cronolog
fi
# end of script
# ----------------------------------------------------------------------
echo ""
echo " lamp is installed."
echo " congrats !!"
echo ""
echo " you can configure your own server now :)"
echo " open your web browser and type \"localhost\""
echo " on the address bar. a big \"It Works\" confirms installation"
echo ""
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
