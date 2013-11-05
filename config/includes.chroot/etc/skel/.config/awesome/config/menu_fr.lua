-- {{{ Menu
-- submenu

-- Graph submenu -------------------------------------------------------
capture = {
    { "maintenant", "screenshot -a"},
    { "dans 5s", "screenshot -d"},
    { "focus dans 2s", "screenshot -w"},
    { "dans une Zone", "screenshot -z"}
 }
------------------------------------------------------------------------

-- Preferences submenu -------------------------------------------------
awesomemenu = {
    { "awesome_start", editor_cmd .." bin/start/awesome_start.sh" },
    { "config.lua", editor_cmd .." ".. config_dir .."/config.lua"},
    { "-----------"},
    { "fichiers *lua :"},
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
    { "relancer", awesome.restart },
    { "quitter", awesome.quit },
}

composite = {
    { "sans effet", "xcompmgr_livarp -s" },
    { "effet leger", "xcompmgr_livarp -l" },
    { "effect complet", "xcompmgr_livarp -f" },
    { "configurer", terminal.." -e sudo vim /usr/local/bin/xcompmgr_livarp" },
    { "page de man", terminal.." -e man xcompmgr" },
}
screensaver = {
    { "configurer", "xscreensaver-demo" },
    { "relancer", "xscreensaver-command -restart" },
    { "quitter", "xscreensaver-command -exit" },
}
------------------------------------------------------------------------

prefs = {
    { "awesome", awesomemenu },
    { "~.xinitrc", editor_cmd .." .xinitrc" },
    { "affichage", "arandr" },
    { "interface", "lxappearance" },
    { "fond d'écran", "nitrogen " },
    { "screensaver", screensaver },
    { "composite", composite},
}
accessoires = {
    { "terminal", terminal },
    { "rechercher", "catfish" },
    { "renommer", "pyrenamer" },
    { "vérifier", "fslint-gui" },
    { "archiver", archiver },
    { "éditeur geany", guieditor },
    { "fichiers", filegui },
    { "# fichiers", "gksu rox-filer" },
}
multimedia = {
    { "lecteur de media", mediaplayer },
    { "lecteur de musique", musicplayer },
    { "graveur cd/dvd", burner },
    { "volume", volumecontrol },
}
internet = {
    { "firefox", webgui },
    { "weechat IRC", terminal.." -e weechat-curses" },
    { "claws-mail", "claws-mail" },
    { "client FTP", "filezilla" },
    { "transmission", "transmission-gtk" },
}
bureautique = {
    { "éditeur geany", guieditor },
    { "calculatrice", calc },
    { "visionneur PDF", pdf },
}
graphismmenu = {
    { "images", imageviewer },
    { "couleurs", "gcolor2" },
    { "capture", capture },
}
applications = {
    { "internet", internet },
    { "multimedia", multimedia },
    { "graphiques", graphismmenu },
    { "bureautique", bureautique },
    { "accessoires", accessoires },
}
systemmenu = {
    { "gestion des deb", "gksu synaptic" },
    { "gparted", "gksu gparted" },
    { "apps par défaut", terminal.." -e sudo update-alternatives --all" },
    { "usage du disque", terminal.." -e ncdu" },
    { "# terminal", terminal.." -e su" },
    { "clickme's", "rox bin/clickmes" },
    { "livarp-xs-maker", "/usr/local/bin/livarp-xs.sh" }
}
helpmenu = {
    { "centre d'aide", webgui.." /usr/share/livarp/help_center/index.html" },
    { "wiki arpinux", webgui.." http://arpinux.org/x" },
    { "raccourcis", terminal.." -e awesome_keys.sh" },
    { "page de manuel", terminal .." -e man awesome" },
}
climenu = {
    { "$ terminal", terminal },
    { "# terminal", terminal.." -e su" },
    { "fichiers", terminal.." -e ranger" },
    { "éditeur vim", terminal.." -e vim" },
    { "radio", terminal.." -e cli_radio" },
    { "musique", musicplayer },
    { "navigateur web", webcli.." http://arpinux.org/livarp_start" },
    { "client mail", terminal.." -e mutt" },
    { "usage disque", terminal.." -e ncdu" },
    { "clean upgrade", terminal.." -e clean_upgrade.sh" }
}
------------------------------------------------------------------------

-- Main Menu -----------------------------------------------------------
mymainmenu = awful.menu({ items = {
    { "exécuter", "dmenu-bind.sh" },
    { "cli apps", climenu },
    { "-----     -----" },
    { "terminal", terminal },
    { "fichiers", filegui },
    { "navigateur", webgui.." http://arpinux.org/livarp_start" },
    { "éditeur", "geany" },
    { "lecteur média", "gnome-mplayer" },
    { "-----     -----" },
    { "applications", applications },
    { "préférences", prefs },
    { "système", systemmenu },
    { "aide", helpmenu },
    { "-----     -----" },
    { "verrouiller", locker },
    { "quitter", "dmenu-quit.sh" }
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
