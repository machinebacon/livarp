-- {{{ Menu
-- submenu

-- Graph submenu -------------------------------------------------------
capture = {
    { "now", "screenshot -a"},
    { "in 5s", "screenshot -d"},
    { "focus in 2s", "screenshot -w"},
    { "in a Zone", "screenshot -z"}
 }
------------------------------------------------------------------------

-- Preferences submenu -------------------------------------------------
awesomemenu = {
    { "awesome_start", editor_cmd .." bin/start/awesome_start.sh" },
    { "config.lua", editor_cmd .." ".. config_dir .."/config.lua"},
    { "-----------"},
    { "edit lua files :"},
    { "keys", editor_cmd .." ".. config_dir .."/config/keys.lua"},
    { "menu", editor_cmd .." ".. config_dir .."/config/menu.lua"},
    { "mouse", editor_cmd .." ".. config_dir .."/config/mouse.lua"},
    { "rules_dynamic", editor_cmd .." ".. config_dir .."/config/rules_dynamic.lua"},
    { "rules_static", editor_cmd .." ".. config_dir .."/config/rules_static.lua"},
    { "signals", editor_cmd .." ".. config_dir .."/config/signals.lua"},
    { "tags_dynamic", editor_cmd .." ".. config_dir .."/config/tags_dynamic.lua"},
    { "tags_static", editor_cmd .." ".. config_dir .."/config/tags_static.lua"},
    { "widgets_simple", editor_cmd .." ".. config_dir .."/config/widgets_simple.lua"},
    { "widgets_arrow", editor_cmd .." ".. config_dir .."/config/widgets_arrow.lua"},
    { "-----------"},
    { "reload", awesome.restart },
    { "exit", awesome.quit },
}

composite = {
    { "no effect", "xcompmgr_livarp -s" },
    { "light effect", "xcompmgr_livarp -l" },
    { "full effect", "xcompmgr_livarp -f" },
    { "configure", terminal.." -e sudo vim /usr/local/bin/xcompmgr_livarp" },
    { "man page", terminal.." -e man xcompmgr" },
}
screensaver = {
    { "configure", "xscreensaver-demo" },
    { "reload", "xscreensaver-command -restart" },
    { "stop", "xscreensaver-command -exit" },
}
------------------------------------------------------------------------

prefs = {
    { "awesome", awesomemenu },
    { "~.xinitrc", editor_cmd .." .xinitrc" },
    { "display", "arandr" },
    { "interface", "lxappearance" },
    { "wallpaper", "nitrogen " },
    { "screensaver", screensaver },
    { "composite", composite},
}
accessoires = {
    { "terminal", terminal },
    { "search tool", "catfish" },
    { "rename", "pyrenamer" },
    { "fs checker", "fslint-gui" },
    { "file-roller", archiver },
    { "text editor", guieditor },
    { "file-manager", "rox-filer" },
    { "# file-manager", "gksu rox-filer" },
}
multimedia = {
    { "media player", mediaplayer },
    { "music player", musicplayer },
    { "cd/dvd burner", burner },
    { "volume", volumecontrol },
}
internet = {
    { "firefox", "firefox" },
    { "weechat IRC", terminal.." -e weechat-curses" },
    { "claws-mail", "claws-mail" },
    { "FTP client", "filezilla" },
    { "transmission", "transmission-gtk" },
}
bureautique = {
    { "text editor", "geany" },
    { "calculate", "xcalc" },
    { "PDF viewer", "evince" },
}
graphismmenu = {
    { "image viewer", "gthumb" },
    { "gcolor2", "gcolor2" },
    { "screenshot", capture },
}
applications = {
    { "internet", internet },
    { "multimedia", multimedia },
    { "graphics", graphismmenu },
    { "office", bureautique },
    { "accessories", accessoires },
}
systemmenu = {
    { "deb manager", "gksu synaptic" },
    { "gparted", "gksu gparted" },
    { "default apps", terminal.." -e sudo update-alternatives --all" },
    { "disks usage", terminal.." -e ncdu" },
    { "# terminal", terminal.." -e su" },
    { "clickme's", "rox bin/clickmes" },
    { "livarp-xs-maker", "/usr/local/bin/livarp-xs.sh" }
}
helpmenu = {
    { "help-center", webgui.." /usr/share/livarp/help_center/index.html" },
    { "arpinux wiki", webgui.." http://arpinux.org/x" },
    { "keybinds", terminal.." -e awesome_keys.sh" },
    { "man page", terminal .." -e man awesome" },
}
climenu = {
    { "$ terminal", terminal },
    { "# terminal", terminal.." -e su" },
    { "file-manager", terminal.." -e ranger" },
    { "vim editor", terminal.." -e vim" },
    { "radio player", terminal.." -e cli_radio" },
    { "music player", musicplayer },
    { "web browser", webcli.." http://arpinux.org/livarp_start" },
    { "mail client", terminal.." -e mutt" },
    { "disk usage", terminal.." -e ncdu" },
    { "clean upgrade", terminal.." -e clean_upgrade.sh" }
}
------------------------------------------------------------------------

-- Main Menu -----------------------------------------------------------
mymainmenu = awful.menu({ items = {
    { "run", "dmenu-bind.sh" },
    { "cli apps", climenu },
    { "-----     -----" },
    { "terminal", terminal },
    { "file manager", filegui },
    { "web browser", webgui.." http://arpinux.org/livarp_start" },
    { "text editor", "geany" },
    { "media player", "gnome-mplayer" },
    { "-----     -----" },
    { "applications", applications },
    { "preferences", prefs },
    { "system", systemmenu },
    { "help", helpmenu },
    { "-----     -----" },
    { "lock screen", locker },
    { "exit menu", "dmenu-quit.sh" }
}})
------------------------------------------------------------------------

-- Launcher Menu -------------------------------------------------------
if menu_icon then
    mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mymainmenu })
else
    mylauncher = ""
end
------------------------------------------------------------------------

-- Aphelion & arpinux @2013 --------------------------------------------
