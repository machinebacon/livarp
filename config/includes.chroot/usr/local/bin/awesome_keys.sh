#! /bin/bash
# livarp_0.4 awesome keybinds & shortcuts
#########################################

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
echo -e "   ${green}livarp 0.4 awesome keybinds & shortcuts$NC"
echo -e " ${green}defined in ~/.config/awesome/config/keys.lua$NC"
echo ""
echo -e " ${RED} reload awesome  $NC Ctrl + Alt + r"
echo -e " ${RED} quit awesome    $NC Ctrl + Alt + q"
echo -e " ${RED} quit client     $NC Alt + q"
echo ""
echo -e " ${BLUE} awesome menu       $NC Alt + p"
echo -e " ${BLUE} start dmenu        $NC Alt + F2"
echo ""
echo -e " ${GREEN} open a terminal   $NC Alt + Return"
echo -e " ${GREEN} open rox-filer    $NC Alt + Shift + f"
echo -e " ${GREEN} open ranger       $NC Alt + f"
echo -e " ${GREEN} open firefox      $NC Alt + w"
echo -e " ${GREEN} open weechat      $NC Alt + i"
echo -e " ${GREEN} open music player $NC Alt + m"
echo -e " ${GREEN} volume contol     $NC Alt + v"
echo ""
echo -e " ${BLUE} toggle free client  $NC Alt + Ctrl + space"
echo -e " ${BLUE} previous layout     $NC Alt + Shift + space"
echo -e " ${BLUE} next layout         $NC Alt + space"
echo ""
echo -e " ${CYAN} prev/next client     $NC Alt + k/j"
echo -e " ${CYAN} swap clients         $NC Alt + Ctrl + k/j"
echo -e " ${CYAN} goto urgent client   $NC Alt + u"
echo -e " ${CYAN} prev/next tag        $NC Alt + Left/Right"
echo -e " ${CYAN} last tag             $NC Alt + Escape"
echo -e " ${CYAN} last client          $NC Alt + Tab"
echo ""
echo -e " ${CYAN} sendto prev/next tag   $NC Alt (+ Shift) + n"
echo -e " ${CYAN} goto 'n' tag           $NC Alt + [1..n]"
echo ""
echo ""
echo -e " ${green} full manual available with [man awesome]"
echo -e " ${green} full keybinds list available in help-center"
echo -en " ${green} hit Enter to quit..."
read anykey
exit 0
