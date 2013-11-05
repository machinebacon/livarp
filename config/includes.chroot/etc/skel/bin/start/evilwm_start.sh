#! /bin/bash
# livarp_0.4 evilwm start-up script
###################################

## post-install script ## ----------------------------------------------
## safe to remove after execution
if ! [ -d /home/human ]; then
    if ! [ -e /usr/share/livarp/livarpfirstlog ]; then
        (sleep 10s && urxvtcd --geometry 90x30 -e su-to-root -c /usr/local/bin/livarp_postinstall.sh) &
    fi
fi

## launch mail-checker ## edit if needed -------------------------------
#if ping -c 1 -w 1 194.2.0.20 &>/dev/null; then
#    sleep 5 && claws-mail &
#fi

## change caps_lock into super key - for old laptop --------------------
#xmodmap ~/.Xmodmap

## launch composite manager --------------------------------------------
xcompmgr_livarp -l &

## launch panel --------------------------------------------------------
sleep 1 && fbpanel &

## setup auto-mounting -------------------------------------------------
sleep 10 && udisks-glue --session &

## set evil wallpaper --------------------------------------------------
#nitrogen --restore ## uncomment to display your favorite wallpaper
#/usr/share/backgrounds/randwalls.sh & ## uncomment for a random system wall
feh --no-xinerama --bg-fill /usr/share/backgrounds/livarp_04.png

## launch conky --------------------------------------------------------
sleep 5s && conky -q -c ~/.conky/conkyrc_evil

## setup network -------------------------------------------------------
nm-applet &

## launch evilwm in a loop with a log file -----------------------------
while true; do
    evilwm -snap 10 -term urxvtcd -nosoliddrag 2> ~/.evilwm.log
done
