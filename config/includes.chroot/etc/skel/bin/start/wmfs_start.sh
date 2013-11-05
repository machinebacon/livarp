#! /bin/bash
# livarp_0.4 wmfs start-up script
#################################

## post-install script ## ----------------------------------------------
## safe to remove after execution
if ! [ -d /home/human ]; then
    if ! [ -e /usr/share/livarp/livarpfirstlog ]; then
        (sleep 10s && urxvtcd -e su-to-root -c /usr/local/bin/livarp_postinstall.sh) &
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
sleep 2 && fbpanel &

## setup auto-mounting -------------------------------------------------
sleep 10 && udisks-glue --session &

## set wmfs wallpaper --------------------------------------------------
#nitrogen --restore ## uncomment to display your favorite wallpaper
#/usr/share/backgrounds/randwalls.sh & ## uncomment for a random system wall
feh --no-xinerama --bg-fill /usr/share/backgrounds/livarp_04.png

## setup network -------------------------------------------------------
nm-applet &

## set statusbars ------------------------------------------------------
conkyd -c ~/.conky/conkyrc_wmfs | while true; read line; do wmfs -c status "topbar $line"; done &
conkyd -c ~/.conky/conkyrc_wmfs_launchers | while true; read line; do wmfs -c status "bottombar $line"; done &

## launch wmfs ---------------------------------------------------------
exec /usr/local/bin/wmfs
