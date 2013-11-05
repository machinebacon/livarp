#! /bin/bash
# simple help script for WMFS2 by arpinux
# livarp_0.4 default shortcuts list

xpos="5"
ypos="5"
width="350"
height="250"
bg="#222222"
fg="#7D7D7D"
l01="^s[80;12;$bg;livarp 0.4        Shortcuts Help]"
l03="^s[15;35;$fg;launch terminal:]^s[190;35;$fg;Super + Return]"
l04="^s[15;50;$fg;launch prompt:]^s[190;50;$fg;Super + p]"
l05="^s[15;65;$fg;close client:]^s[190;65;$fg;Super + q]"
l06="^s[15;80;$fg;reload wmfs:]^s[190;80;$fg;Control + Alt + r]"
l07="^s[15;95;$fg;quit wmfs:]^s[190;95;$fg;Control + Alt + q]"

l08="^s[15;115;$fg;open file-manager:]^s[190;115;$fg;Alt + Shift + r]"
l09="^s[15;130;$fg;open cli-file-manager:]^s[190;130;$fg;Alt + r]"
l10="^s[15;145;$fg;open firefox navigator:]^s[190;145;$fg;Alt + w]"
l11="^s[15;160;$fg;open weechat irc:]^s[190;160;$fg;Alt + x]"
l12="^s[15;175;$fg;open vim editor:]^s[190;175;$fg;Alt + e]"
l13="^s[15;190;$fg;open geany editor:]^s[190;190;$fg;Alt + Shift + e]"
l14="^s[15;205;$fg;open cmus music player:]^s[190;205;$fg;Alt + z]"
l15="^s[15;220;$fg;open volume control:]^s[190;220;$fg;Alt + v]"

frame="^R[0;0;350;15;$fg] ^R[0;248;350;2;$fg] ^R[0;0;2;250;$fg] ^R[348;0;2;250;$fg]"

wmfs -c status_surface "$xpos,$ypos,$width,$height,$bg $frame $l01 $l03 $l04 $l05 $l06 $l07 $l08 $l09 $l10 $l11 $l12 $l13 $l14 $l15"
