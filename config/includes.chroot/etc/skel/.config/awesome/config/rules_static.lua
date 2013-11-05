-- Rules ---------------------------------------------------------------
-- SHIFTY: application matching rules
-- order here matters, early rules will be applied first
shifty.config.apps = {
    { match = {"^Download$", "Preferences" }, float = true, intrusive = true },
    { match = {"lxappearence","MPlayer","ffplay","gnome-mplayer" }, float = true, opacity = 1.0 },
    { match = { "urxvt" }, honnorsizehints = false, slave = true },
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

shifty.config.sloppy = true
shifty.config.float_bars = enable_floatbar

--Aphelion@2013---------------------------------------------------------
