#! /bin/bash
# simple help script for WMFS2 by arpinux
# default keybinds list

xpos="5"
ypos="5"
width="350"
height="730"
bg="#222222"
fg="#7D7D7D"
l01="^s[80;12;$bg;WMFS         Keybinds Help]"
l03="^s[15;35;$fg;launch terminal:]^s[190;35;$fg;Super + Return]"
l04="^s[15;50;$fg;launch prompt:]^s[190;50;$fg;Super + p]"
l05="^s[15;65;$fg;close client:]^s[190;65;$fg;Super + q]"
l06="^s[15;80;$fg;reload wmfs:]^s[190;80;$fg;Control + Alt + r]"
l07="^s[15;95;$fg;quit wmfs:]^s[190;95;$fg;Control + Alt + q]"

l08="^s[15;115;$fg;next client:]^s[190;115;$fg;Alt + Tab]"
l09="^s[15;130;$fg;prev client:]^s[190;130;$fg;Alt + Shift + Tab]"
l10="^s[15;145;$fg;next tabbed client:]^s[190;145;$fg;Super + Tab]"
l11="^s[15;160;$fg;prev tabbed client:]^s[190;160;$fg;Super + Shift + Tab]"
l12="^s[15;175;$fg;left client:]^s[190;175;$fg;Alt + h]"
l13="^s[15;190;$fg;right client:]^s[190;190;$fg;Alt + l]"
l14="^s[15;205;$fg;top client:]^s[190;205;$fg;Alt + k]"
l15="^s[15;220;$fg;bottom client:]^s[190;220;$fg;Alt + j]"
l16="^s[15;235;$fg;swap client left:]^s[190;235;$fg;Control + Shift + h]"
l17="^s[15;250;$fg;swap client right:]^s[190;250;$fg;Control + Shift + l]"
l18="^s[15;265;$fg;swap client top:]^s[190;265;$fg;Control + Shift + k]"
l19="^s[15;280;$fg;swap client bottom:]^s[190;280;$fg;Control + Shift + j]"
l20="^s[15;295;$fg;tab client left:]^s[190;295;$fg;Alt + Shift + h]"
l21="^s[15;310;$fg;tab client right:]^s[190;310;$fg;Alt + Shift + l]"
l22="^s[15;325;$fg;tab client top:]^s[190;325;$fg;Alt + Shift + k]"
l23="^s[15;340;$fg;tab client bottom:]^s[190;340;$fg;Alt + Shift + j]"
l24="^s[15;355;$fg;untab client:]^s[190;355;$fg;Alt + Shift + u]"

l25="^s[15;375;$fg;increase client on left:]^s[190;375;$fg;Super + h]"
l26="^s[15;390;$fg;decrease client from left:]^s[190;390;$fg;Super + l]"
l27="^s[15;405;$fg;increase client on top:]^s[190;405;$fg;Super + k]"
l28="^s[15;420;$fg;decrease client from top:]^s[190;420;$fg;Super + j]"
l29="^s[15;435;$fg;decrease client from right:]^s[190;435;$fg;Super + Control + h]"
l30="^s[15;450;$fg;increase client on right:]^s[190;450;$fg;Super + Control + l]"
l31="^s[15;465;$fg;decrease client from bottom:]^s[190;465;$fg;Super + Control + k]"
l32="^s[15;480;$fg;increase client to bottom:]^s[190;480;$fg;Super + Control + j]"
l33="^s[15;495;$fg;integrate client to left:]^s[190;495;$fg;Super + Control + Alt + h]"
l34="^s[15;510;$fg;integrate client to right:]^s[190;510;$fg;Super + Control + Alt + l]"
l35="^s[15;525;$fg;integrate client to top:]^s[190;525;$fg;Super + Control + Alt + k]"
l36="^s[15;540;$fg;integrate client to bottom:]^s[190;540;$fg;Super + Control + Alt + j]"

l37="^s[15;560;$fg;horizontal layout:]^s[190;560;$fg;Super + Shift + m]"
l38="^s[15;575;$fg;vertical layout:]^s[190;575;$fg;Super + m]"
l39="^s[15;590;$fg;layout rotate right:]^s[190;590;$fg;Super + r]"
l40="^s[15;605;$fg;layout rotate left:]^s[190;605;$fg;Super + Shift + r]"
l41="^s[15;620;$fg;toggle client free:]^s[190;620;$fg;Super + f]"

l42="^s[15;640;$fg;prev/next tag:]^s[190;640;$fg;Control + Left/Right]"
l43="^s[15;655;$fg;prev/next screen:]^s[190;655;$fg;Control + Up/Down]"
l44="^s[15;670;$fg;set tag (x):]^s[190;670;$fg;Super + F(x)]"
l45="^s[15;685;$fg;tag client with (x):]^s[190;685;$fg;Super + Shift + F(x)]"
l46="^s[15;700;$fg;add tag:]^s[190;700;$fg;Super + Shift + -]"
l47="^s[15;715;$fg;delete tag:]^s[190;715;$fg;Super + -]"

frame="^R[0;0;350;15;$fg] ^R[0;728;350;2;$fg] ^R[0;0;2;730;$fg] ^R[348;0;2;730;$fg]"

wmfs -c status_surface "$xpos,$ypos,$width,$height,$bg $frame $l01 $l03 $l04 $l05 $l06 $l07 $l08 $l09 $l10 $l11 $l12 $l13 $l14 $l15 $l16 $l17 $l18 $l19 $l20 $l21 $l22 $l23 $l24 $l25 $l26 $l27 $l28 $l29 $l30 $l31 $l32 $l33 $l34 $l35 $l36 $l37 $l38 $l39 $l40 $l41 $l42 $l43 $l44 $l45 $l46 $l47"
