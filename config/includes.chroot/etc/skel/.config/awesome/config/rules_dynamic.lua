-- Rules ---------------------------------------------------------
-- SHIFTY: application matching rules
-- order here matters, early rules will be applied first
shifty.config.apps = {
    { match = {"Rox-filer", "xcalc", "file-roller", "lxappearance" }, float = true },
    { match = {"Transmission"}, tag = "bt" },
    { match = {"^Download$", "Preferences", "VideoDownloadHelper" }, float = true, intrusive = true },
    { match = {"luakit","Iceweasel","Firefox" }, tag = "www", opacity = 1.0 },
    { match = {"irssi","weechat" }, tag = "irc" },
    { match = {"Gimp" }, tag = "gimp", float = true , opacity = 1.0 },
    { match = {"gimp-image-window" }, slave = true,  opacity = 1.0 },
    { match = {"MPlayer","ffplay","gnome-mplayer" }, float = true,  opacity = 1.0 },
    { match = {"claws-mail","thunderbird","mutt" }, tag = "mail" },
    { match = {"geany", "vim" }, tag = "edit" },
    { match = {"gajim"}, tag = "msg", float = true },
    { match = {"LibreOffice.*","Abiword","Gnumeric" }, tag = "office" },
    { match = {"VirtualBox"}, tag = "vbox", float = true,  opacity = 1.0 },
    { match = {"lxappearence"}, float = true, opacity = 1.0 },
    { match = {"gthumb","evince" }, float = true, tag = "view" },
    { match = {"urxvt"}, opacity = 0.8, honorsizehints = false, slave = true },
    { match = {""},
        buttons = awful.util.table.join(
            awful.button({}, 1, function (c) client.focus = c; c:raise() end),
            awful.button({modkey}, 1, function(c)
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
            end),
            awful.button({modkey}, 3, awful.mouse.client.resize)
        )
    },
}

-- Aphelion@2013--------------------------------------------------------
