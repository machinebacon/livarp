#!/bin/bash
# a simple session-selector
###########################
# session list
# ------------
choice=`echo -e "01: vtwm\n02: dwm\n03: ratpoison\n04: wmfs\n05: dwm_reloaded\n06: spectrwm\n07: evilwm\n08: openbox\n09: pekwm\n10: awesome\n11: fluxbox\n12: scripts de lancement\n13: éteindre" | dmenu -fn "snap" -nb "#222222" -nf "#7D7D7D" -sb "#005885" -sf "#D7D7D7" -p "choisir ou éditer une session:" | cut -d ':' -f 1`
# session launchers
# -----------------
case $choice in
    01) exec $HOME/bin/start/vtwm_start.sh ;;
    02) exec /usr/bin/dwm ;;
    03) exec $HOME/bin/start/ratpoison_start.sh ;;
    04) exec $HOME/bin/start/wmfs_start.sh ;;
    05) exec $HOME/bin/start/dwm_start.sh ;;
    06) exec $HOME/bin/start/spectrwm_start.sh ;;
    07) exec $HOME/bin/start/evilwm_start.sh ;;
    08) exec /usr/bin/openbox-session ;;
    09) exec $HOME/bin/start/pekwm_start.sh ;;
    10) exec $HOME/bin/start/awesome_start.sh ;;
    11) exec $HOME/bin/start/fluxbox_start.sh ;;
    12) geany -s $HOME/bin/start/*start.sh $HOME/.config/openbox/autostart $HOME/.xinitrc; $HOME/bin/start/dmenu-start.sh ;;
    13) sudo shutdown -h now ;;
    *) $HOME/bin/start/dmenu-start.sh ;;
esac
exit 0
