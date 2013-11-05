#! /bin/bash
# livarp_0.4 dwm keybinds & shortcuts
#####################################

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
echo -e "     ${green}livarp 0.4 dwm keybinds & shortcuts$NC"
echo ""
echo -e " ${RED} reload dwm    $NC Ctrl + Alt + r"
echo -e " ${RED} quit dwm      $NC Ctrl + Alt + Backspace"
echo -e " ${RED} quit livarp   $NC Ctrl + Shift + Alt + q"
echo -e " ${RED} quit client   $NC Alt + q"
echo ""
echo -e " ${BLUE} start dmenu        $NC Alt + p"
echo -e " ${BLUE} scratchpad         $NC F12"
echo ""
echo -e " ${GREEN} open a terminal   $NC Ctrl + Return"
echo -e " ${GREEN} open rox-filer    $NC Alt + Shift + r"
echo -e " ${GREEN} open ranger       $NC Alt + r"
echo -e " ${GREEN} open firefox      $NC Alt + w"
echo -e " ${GREEN} open vim editor   $NC Alt + e"
echo -e " ${GREEN} open geany        $NC Alt + Shift + e"
echo -e " ${GREEN} open weechat      $NC Alt + x"
echo -e " ${GREEN} open music player $NC Alt + z"
echo -e " ${GREEN} volume contol     $NC Alt + v"
echo ""
echo -e " ${BLUE} tiled layout       $NC Alt + t"
echo -e " ${BLUE} bottomstack layout $NC Alt + s"
echo -e " ${BLUE} monocle layout     $NC Alt + m"
echo -e " ${BLUE} floating layout    $NC Alt + f"
echo -e " ${BLUE} toggle layout      $NC Alt + space"
echo -e " ${BLUE} cycle layout       $NC Super + space"
echo ""
echo -e " ${CYAN} prev/next client     $NC Alt + k/j"
echo -e " ${CYAN} prev/next tag        $NC Ctrl + Left/Right"
echo -e " ${CYAN} prev/next screen     $NC Ctrl + Down/Up"
echo ""
echo -e " ${CYAN} sendto prev/next screen     $NC Ctrl + Shift + Down/Up"
echo -e " ${CYAN} sendto 'n' tag              $NC Alt + Shift + [1..n]"
echo -e " ${CYAN} goto 'n' tag                $NC Alt + [1..n]"
echo -e " ${CYAN} toggle free client          $NC Alt + Shift + space"
echo ""
echo ""
echo -e " ${green} full manual available with [man dwm]"
echo -en " ${green} hit Enter to quit..."
read anykey
exit 0
