-- change client border color if focused
client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Cursor Theme Fix
mytimer = timer({timeout = 5})
mytimer:add_signal("timeout", function() awful.util.spawn_with_shell("xsetroot -cursor_name left_ptr") end)
mytimer:start()
awful.util.spawn_with_shell("xsetroot -cursor_name left_ptr")
-- }}}

-- Aphelion@2013--------------------------------------------------------
