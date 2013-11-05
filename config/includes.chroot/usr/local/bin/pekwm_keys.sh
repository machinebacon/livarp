#! /bin/bash
# livarp_0.4 pekwm keybinds & shortcuts
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
echo -e "    ${green}livarp 0.4 pekwm keybinds & shortcuts$NC"
echo ""
echo -e " ${RED} reload pekwm    $NC Ctrl + Alt + r"
echo -e " ${RED} quit pekwm      $NC Ctrl + Alt + Backspace"
echo -e " ${RED} quit livarp     $NC Ctrl + Shift + Alt + q"
echo -e " ${RED} quit client     $NC Super + q"
echo ""
echo -e " ${BLUE} start dmenu        $NC Alt + d"
echo -e " ${BLUE} run command        $NC Super + d"
echo -e " ${BLUE} search command     $NC Super + v"
echo ""
echo -e " ${BLUE} root menu        $NC Super + r"
echo -e " ${BLUE} window menu      $NC Super + w"
echo -e " ${BLUE} goto menu        $NC Super + l"
echo -e " ${BLUE} gotoclient menu  $NC Super + c"
echo -e " ${BLUE} hide all menu    $NC Super + x"
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
echo -e " ${BLUE} close client                $NC Super + q"
echo -e " ${BLUE} toggle maximized client     $NC Super + m"
echo -e " ${BLUE} toggle fullscreen client    $NC Super + f"
echo -e " ${BLUE} toggle shaded client        $NC Super + s"
echo -e " ${BLUE} toggle iconified client     $NC Super + i"
echo ""
echo -e " ${CYAN} prev/next client     $NC Alt (+ Shift) + Tab"
echo -e " ${CYAN} prev/next tabclient  $NC Alt (+ Shift) + Tab"
echo -e " ${CYAN} left/right client    $NC Super + Left/Right"
echo -e " ${CYAN} up/down client       $NC Super + Up/Down"
echo ""
echo -e " ${CYAN} goto left/right desktop     $NC Ctrl + Alt + Left/Right"
echo -e " ${CYAN} goto up/down desktop        $NC Ctrl + Alt + Up/Down"
echo -e " ${CYAN} goto 'n' desktop            $NC Super + [1..n]"
echo -e " ${CYAN} sendto 'n' desktop          $NC Super + [F1..Fn]"
echo ""
echo -e " ${CYAN} sendto-goto left/right desktop    $NC Ctrl + Shift + Alt + Left/Right"
echo -e " ${CYAN} sendto-goto up/down desktop       $NC Ctrl + Shift + Alt + Up/Down"
echo ""
echo ""
echo -e " ${green} full key_CHAINS available in your ~/.pekwm/keys"
echo -en " ${green} hit Enter to quit..."
read anykey
exit 0
