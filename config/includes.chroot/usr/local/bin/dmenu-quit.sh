#!/bin/bash
# a simple logout dialog
########################
choice=`echo -e "0: Cancel\n1: Logout\n2: Shutdown\n3: Reboot\n4: Lock" | dmenu -fn "snap" -nb "#222222" -nf "#7D7D7D" -sb "#005885" -sf "#BFBFBF" -p "select an action:" | cut -d ':' -f 1`

# execute the choice in background
case "$choice" in
    0) exit ;;
    1) xdotool key Ctrl+Alt+BackSpace & ;;
    2) sudo shutdown -h now & ;;
    3) sudo shutdown -r now & ;;
    4) xscreensaver-command -lock & ;;
esac
