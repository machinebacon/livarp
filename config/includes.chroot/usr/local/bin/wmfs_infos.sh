#! /bin/bash
# simple infos script for WMFS2 by arpinux
# livarp_0.3.9 infos launched by conky-launcher

xpos="25"
ypos="25"
width="400"
height="330"
bg="#222222"
fg="#7D7D7D"
# window title:
l01="^s[80;12;$bg;livarp 0.4     WMFS² Infos]"
# infos:
l02="^s[15;35;#D7D7D7;Welcome to livarp_0.4 wmfs session]"
l03="^s[15;50;$fg;`uname` - `uname -r`]"
l04="^s[15;65;$fg;`uptime`]"
# shortcuts:
l05="^s[15;95;$fg;common shortcuts --->]"
l06="^s[15;110;$fg;launch terminal:]^s[190;110;$fg;Super + Return]"
l07="^s[15;125;$fg;launch prompt:]^s[190;125;$fg;Super + p]"
l08="^s[15;140;$fg;close client:]^s[190;140;$fg;Super + q]"
l09="^s[15;155;$fg;reload wmfs:]^s[190;155;$fg;Control + Alt + r]"
l10="^s[15;170;$fg;quit wmfs:]^s[190;170;$fg;Control + Alt + q]"

l11="^s[15;190;$fg;open file-manager:]^s[190;190;$fg;Alt + Shift + r]"
l12="^s[15;205;$fg;open cli-file-manager:]^s[190;205;$fg;Alt + r]"
l13="^s[15;220;$fg;open firefox navigator:]^s[190;220;$fg;Alt + w]"
l14="^s[15;235;$fg;open weechat irc client:]^s[190;235;$fg;Alt + x]"
l15="^s[15;250;$fg;open vim editor:]^s[190;250;$fg;Alt + e]"
l16="^s[15;265;$fg;open geany editor:]^s[190;265;$fg;Alt + Shift + e]"
l17="^s[15;280;$fg;open cmus music player:]^s[190;280;$fg;Alt + z]"
l18="^s[15;295;$fg;open volume control:]^s[190;295;$fg;Alt + v]"
l19="^s[95;325;#D7D7D7;- full help available from wmfs menu -]"

frame="^R[0;0;400;15;$fg] ^R[0;328;400;2;$fg] ^R[0;0;2;330;$fg] ^R[398;0;2;330;$fg]"

wmfs -c status_surface "$xpos,$ypos,$width,$height,$bg $frame $l01 $l02 $l03 $l04 $l05 $l06 $l07 $l08 $l09 $l10 $l11 $l12 $l13 $l14 $l15 $l16 $l17 $l18 $l19"
