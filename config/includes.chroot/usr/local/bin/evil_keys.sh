#! /bin/bash
# livarp_0.4 evil keybinds & shortcuts
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
echo -e "     ${green}livarp 0.4 evil keybinds & shortcuts$NC"
echo ""
echo " modkey by default : Mod = Ctrl + Alt"
echo ""
echo -e " ${RED} quit evilwm     $NC Mod + Backspace"
echo -e " ${RED} quit livarp     $NC Ctrl + Shift + Alt + q"
echo -e " ${RED} quit client     $NC Mod + esc"
echo ""
echo -e " ${GREEN} open a terminal    $NC Mod + Return"
echo ""
echo -e " ${BLUE} move client           $NC Mod + h/j/k/l or Alt + B1"
echo -e " ${BLUE} place client          $NC Mod + y/u/b/n"
echo -e " ${BLUE} resize client         $NC Mod + Shift + h/j/k/l or Alt + B2"
echo -e " ${BLUE} lower client          $NC Mod + insert or Alt + B3"
echo -e " ${BLUE} toggle maximize       $NC Mod + x"
echo -e " ${BLUE} toggle vert maximize  $NC Mod + ="
echo -e " ${BLUE} infos client          $NC Mod + i"
echo -e " ${BLUE} fix client            $NC Mod + f"
echo ""
echo -e " ${CYAN} prev/next desktop    $NC Mod + Left/Right"
echo -e " ${CYAN} prev/next client     $NC Alt + Tab"
echo -e " ${CYAN} goto 'n' tag         $NC Mod + [1..n]"
echo ""
echo ""
echo -e " ${green} full manual available with [man evilwm]"
echo -en " ${green} hit Enter to quit..."
read anykey
exit 0
