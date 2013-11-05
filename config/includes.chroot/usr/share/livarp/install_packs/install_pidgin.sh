#!/bin/bash
################################
## pidgin installation script ##
##----------------------------##
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
echo -e "${cyan} welcome to pidgin install script"
echo -e " --------------------------------$NC"
echo ""
echo " this script will : "
echo " - install pidgin ... really ???"
echo " - yep ... in fact no, it won't"
echo ""
echo " just do it yourself :)"
echo ""
echo " open a terminal and type : \"sudo apt-get install pidgin\" "
echo ""
echo " have a nice day :)"
echo -n " hit Enter to leave."
read anykey
exit 0
# eof ------------------------------------------------------------------
