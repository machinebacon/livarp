------------------------------------------------------------------------
-- Modkeys -- defined in ~/.config/awesome/config/modkey.lua
------------------------------------------------------------------------

-- Key bindings --------------------------------------------------------
globalkeys = awful.util.table.join(
    awful.key( k_m, "Left",	awful.tag.viewprev),
    awful.key( k_m, "Right", awful.tag.viewnext),
    awful.key( k_m, "Escape", awful.tag.history.restore),
    awful.key( k_m, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key( k_m, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
------------------------------------------------------------------------

-- Shifty: keybindings specific to shifty ------------------------------
    awful.key(k_ms, "d", shifty.del), -- delete a tag
    awful.key(k_ms, "n", shifty.send_prev), -- client to prev tag
    awful.key(k_m, "n", shifty.send_next), -- client to next tag
    awful.key(k_mc, "n",
        function()
            local t = awful.tag.selected()
            local s = awful.util.cycle(screen.count(), t.screen + 1)
            awful.tag.history.restore()
            t = shifty.tagtoscr(s, t)
            awful.tag.viewonly(t)
        end),
    awful.key(k_m, "a", shifty.add), -- create a new tag
    awful.key(k_ms,"r", shifty.rename), -- rename a tag
    awful.key(k_ms,"a", -- nopopup new tag
        function() shifty.add({nopopup = true}) end),
------------------------------------------------------------------------

-- Layout manipulation -------------------------------------------------
    awful.key( k_mc	, "j", function () awful.client.swap.byidx(  1) end),
    awful.key( k_mc	, "k", function () awful.client.swap.byidx( -1) end),
    awful.key( k_mcs, "j", function () awful.screen.focus_relative( 1) end),
    awful.key( k_mcs, "k", function () awful.screen.focus_relative(-1) end),
    awful.key( k_m	, "u", awful.client.urgent.jumpto),
    awful.key( k_m	, "Tab", function () awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end end),
------------------------------------------------------------------------

-- Standard program ----------------------------------------------------
awful.key( k_m	, "Return", function () awful.util.spawn(terminal) end),
awful.key( k_m  , "F2", function () awful.util.spawn("dmenu-bind.sh") end),
awful.key( k_ms	, "f", function () awful.util.spawn(filegui) end),
awful.key( k_m	, "f", function () awful.util.spawn(filecli) end),
awful.key( k_m	, "w", function () awful.util.spawn(webcli .. " http://arpinux.org/livarp_start") end),
awful.key( k_ms	, "w", function () awful.util.spawn(webgui .. " http://arpinux.org/livarp_start") end),
awful.key( k_ms	, "m", function () awful.util.spawn(mediaplayer) end),
awful.key( k_m	, "m", function () awful.util.spawn(musicplayer) end),
awful.key( k_m	, "v", function () awful.util.spawn(volumecontrol) end),
awful.key( k_m	, "i", function () awful.util.spawn(irc) end),

awful.key( k_mc	, "r", awesome.restart),
awful.key( k_mc	, "q", awesome.quit),

-- Menu ----------------------------------------------------------------
awful.key( k_m, "p", function () mymainmenu:show({keygrabber=true}) end),
awful.key( {}, "Menu", function () mymainmenu:show({keygrabber=true}) end),
------------------------------------------------------------------------

--- Client manipulation ------------------------------------------------
awful.key( k_m	, "l",     function () awful.tag.incmwfact( 0.05)    end),
awful.key( k_m	, "h",     function () awful.tag.incmwfact(-0.05)    end),
awful.key( k_ms	, "h",     function () awful.tag.incnmaster( 1)      end),
awful.key( k_ms	, "l",     function () awful.tag.incnmaster(-1)      end),
awful.key( k_mc	, "h",     function () awful.tag.incncol( 1)         end),
awful.key( k_mc	, "l",     function () awful.tag.incncol(-1)         end),
awful.key( k_m	, "space", function () awful.layout.inc(layouts,  1) end),
awful.key( k_ms	, "space", function () awful.layout.inc(layouts, -1) end),
------------------------------------------------------------------------

-- Print screen --------------------------------------------------------
awful.key({ }, "Print", function () awful.util.spawn("scrot '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ".. screenshots .." & gthumb ".. screenshots .."$f'") end),
------------------------------------------------------------------------

-- Lock screen ---------------------------------------------------------
awful.key({ }, "XF86ScreenSaver", function () awful.util.spawn(locker)end),
------------------------------------------------------------------------

-- Sleep (suspend to ram) ----------------------------------------------
awful.key({ }, "XF86Sleep", function () awful.util.spawn("dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Hibernate")end),
------------------------------------------------------------------------

-- Suspend (suspend to disk) -------------------------------------------
awful.key({ }, "XF86Suspend", function () awful.util.spawn("dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend")end),
------------------------------------------------------------------------

-- Volume control ------------------------------------------------------
awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -q sset Master 1dB+", false) end),
awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -q sset Master 1dB-", false) end),
awful.key({ }, "XF86AudioMute", function () awful.util.spawn("amixer -q sset Master toggle") end),
------------------------------------------------------------------------

-- Battery
--XF86Battery

-- Display
--XF86Display
awful.key({ }, "XF86Display", function () awful.util.spawn("arandr")end),

--brightness
--XF86MonBrightnessDown
--XF86MonBrightnessUp

-- wlan
--XF86WLAN

--touchpad
--XF86Launch1

--poweroff
--XF86PowerOff
awful.key({ }, "XF86PowerOff", function () awful.util.spawn("dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend")end),

-- Prompt --------------------------------------------------------------
    awful.key(k_m, "r", function ()
        awful.prompt.run({prompt=">>Execute : "},
        mypromptbox[mouse.screen].widget,
        check_for_terminal,
        clean_for_completion,
        awful.util.getdir("cache") .. "/history") 
    end),

    awful.key(k_m, "F3", function ()
        awful.prompt.run({ prompt = ">>Web : " }, mypromptbox[mouse.screen].widget,
        function (command)
            awful.util.spawn("iceweasel 'http://yubnub.org/parser/parse?command="..command.."'", false)
            -- Switch to the web tag, where Firefox is, in this case tag 3
            if tags[mouse.screen]['www'] then awful.tag.viewonly(tags[mouse.screen]['www']) end
        end)
    end),

	awful.key(k_m, "c", function ()
        awful.prompt.run({ prompt = ">>Calc. : " }, mypromptbox[mouse.screen].widget,
        function (expr)
            local result = awful.util.eval("return (" .. expr .. ")")
            naughty.notify({ text = expr .. " = " .. result, timeout = 10 })
        end)
    end),

    awful.key( k_m , "x", function ()
        awful.prompt.run({ prompt = ">>Execute Lua : " },
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval")
    end)
)

-- Client KeyBinds -----------------------------------------------------
clientkeys = awful.util.table.join(
    awful.key( k_mc	, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key( k_m	, "q",      function (c) c:kill()                         end),
    awful.key( k_mc	, "space",  awful.client.floating.toggle                     ),
    awful.key( k_mc	, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key( k_m	, "o",      awful.client.movetoscreen                        ),
    awful.key( k_ms	, "r",      function (c) c:redraw()                       end),
    awful.key( k_mc	, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key( k_mc	, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key( k_mc , "m",      function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c.maximized_vertical   = not c.maximized_vertical
    end)
)
------------------------------------------------------------------------

-- Bind all key numbers to tags ----------------------------------------
-- SHIFTY: assign client keys to shifty for use in
-- match() function(manage hook)
shifty.config.clientkeys = clientkeys
shifty.config.modkey = k_m

-- {{{ Tag controls
-- Compute the maximum number of digit we need, limited to 9
for i = 1, (shifty.config.maxtags or 9) do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key(k_m, i, function()
            local t =  awful.tag.viewonly(shifty.getpos(i))
            end),
        awful.key(k_mc, i, function()
            local t = shifty.getpos(i)
            t.selected = not t.selected
            end),
        awful.key(k_mcs, i, function()
            if client.focus then
                awful.client.toggletag(shifty.getpos(i))
            end
            end),
        -- move clients to other tags
        awful.key(k_ms, i, function()
            if client.focus then
                t = shifty.getpos(i)
                awful.client.movetotag(t)
                awful.tag.viewonly(t)
            end
        end))
    end
-- }}}

-- Set keys ---------
root.keys(globalkeys)
---------------------

-- {{{ functions to help launch run commands in a terminal using ":" keyword 
function check_for_terminal (command)
   if command:sub(1,1) == ":" then
      command = terminal .. ' -e "' .. command:sub(2) .. '"'
   end
   awful.util.spawn(command)
end

function clean_for_completion (command, cur_pos, ncomp, shell)
   local term = false
   if command:sub(1,1) == ":" then
      term = true
      command = command:sub(2)
      cur_pos = cur_pos - 1
   end
   command, cur_pos =  awful.completion.shell(command, cur_pos,ncomp,shell)
   if term == true then
      command = ':' .. command
      cur_pos = cur_pos + 1
   end
   return command, cur_pos
end
------------------------------------------------------------------------
-- Aphelion@2013 -------------------------------------------------------
