#!/bin/bash
# a simple layout selector
##########################
layout=`ls -A /usr/share/X11/xkb/keymap/sgi_vndr/ | dmenu -fn 'snap' -nb '#222222' -nf '#7D7D7D' -sb '#005885' -sf '#D7D7D7' -p 'select a layout: '` && eval "setxkbmap $layout"
