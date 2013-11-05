#! /bin/bash
# livarp_0.4 spectrwm keybinds & shortcuts
##########################################

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
echo -e "  ${green}livarp 0.4 spectrwm keybinds & shortcuts$NC"
echo ""
echo -e " ${RED} reload spectrwm     $NC Alt + q"
echo -e " ${RED} quit spectrwm       $NC Alt + Shift + q"
echo -e " ${RED} quit client         $NC Alt + x"
echo -e " ${RED} kill client         $NC Alt + Shift + x"
echo ""
echo -e " ${BLUE} start dmenu        $NC Alt + p"
echo ""
echo -e " ${GREEN} open a terminal   $NC Alt + Shift + Return"
echo -e " ${GREEN} open rox-filer    $NC Super + Shift + r"
echo -e " ${GREEN} open ranger       $NC Super + r"
echo -e " ${GREEN} open firefox      $NC Super + w"
echo -e " ${GREEN} open vim editor   $NC Super + e"
echo -e " ${GREEN} open geany        $NC Super + Shift + e"
echo -e " ${GREEN} open music player $NC Super + z"
echo -e " ${GREEN} volume contol     $NC Super + v"
echo -e " ${GREEN} keybinds          $NC Super + h"
echo ""
echo -e " ${BLUE} cycle layout       $NC Alt + space"
echo ""
echo -e " ${CYAN} prev/next client     $NC Alt + k/j or Tab"
echo -e " ${CYAN} prev/next busy tag   $NC Alt + Left/Right"
echo -e " ${CYAN} prev/next tag        $NC Alt + Up/Down"
echo -e " ${CYAN} last busy tag        $NC Alt + a"
echo ""
echo -e " ${CYAN} sendto 'n' tag         $NC Alt + Shift + [1..n]"
echo -e " ${CYAN} goto 'n' tag           $NC Alt + [1..n]"
echo -e " ${CYAN} goto prev/next region  $NC Alt + Shift + Left/Right"
echo -e " ${CYAN} toggle free client     $NC Alt + t"
echo -e " ${CYAN} minimize client        $NC Alt + w"
echo -e " ${CYAN} restore client         $NC Alt + Shift + w"
echo -e " ${CYAN} search client          $NC Alt + f"
echo ""
echo ""
echo -e " ${green} full manual available with [man spectrwm]"
echo -en " ${green} hit Enter to quit..."
read anykey
exit 0
