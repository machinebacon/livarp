#! /bin/bash
# livarp_0.4 vtwm keybinds & shortcuts
######################################

## text colors ---------------------------------------------------------
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
green='\e[0;32m'
yellow='\e[0;33m'
## No Color
NC='\e[0m'
## background colors ---------------------------------------------------
RED='\e[41m'
BLUE='\e[44m'
CYAN='\e[46m'
GREEN='\e[42m'
YELLOW='\e[43m'
## output --------------------------------------------------------------
echo ""
echo -e "     ${green}livarp 0.4 vtwm keybinds & shortcuts$NC"
echo ""
echo -e " ${RED} reload vtwm   $NC Ctrl + Alt + r"
echo -e " ${RED} quit vtwm     $NC Ctrl + Shift + q"
echo -e " ${RED} quit livarp   $NC Ctrl + Shift + Alt + q"
echo -e " ${RED} quit client   $NC Super + q"
echo -e " ${RED} kill client   $NC Super + x"
echo ""
echo -e " ${BLUE} start dmenu        $NC Super + d"
echo ""
echo -e " ${GREEN} open a terminal   $NC Ctrl + Return"
echo -e " ${GREEN} open rox-filer    $NC Super + Shift + r"
echo -e " ${GREEN} open ranger       $NC Super + r"
echo -e " ${GREEN} open firefox      $NC Super + w"
echo -e " ${GREEN} volume contol     $NC Super + v"
echo ""
echo -e " ${CYAN} prev/next client     $NC Alt + Tab"
echo -e " ${CYAN} prev/next desktop    $NC Ctrl + Left/Right"
echo ""
echo -e " ${CYAN} toggle maximize window      $NC Super + m"
echo -e " ${CYAN} toggle iconify window       $NC Super + i"
echo ""
echo -e " ${green} full manual available with [man vtwm]"
echo -en " ${green} hit Enter to quit..."
read anykey
exit 0
