-- {{{ Wibox
-- Widgets Library -------
require("vicious")
require("popups")

-- call tasklist and taglist menu
local menu = require('menu')

-- Systray -----------------------------
mysystray = widget({ type = "systray" })
----------------------------------------

-- Spacer ---------------------------------------------------------------
spacer = widget({ type = "textbox", name = "myspacer" })
spacer.text = " "
-------------------------------------------------------------------------
-- Blue Spacer ---------------------------------------------------------------
bluespacer = widget({ type = "textbox", name = "myspacer" })
bluespacer.text = "<span background=\"#005885\" font=\"Terminus 12\"><span color=\""..beautiful.fg_focus.."\" font=\"Droid Sans 10\"> </span></span>"
-------------------------------------------------------------------------
-- Arrow ---------------------------------------------------------------
arrl_dl = widget ({type = "imagebox" })
arrl_dl.image = image(beautiful.arrl_dl)

arrl_ld = widget ({type = "imagebox" })
arrl_ld.image = image(beautiful.arrl_ld)
-------------------------------------------------------------------------

-- Create a textclock widget
calicon = widget ({type = "imagebox" })
calicon.image = image(beautiful.widget_cal)
datewidget = widget({ type = "textbox" })
vicious.register(datewidget, vicious.widgets.date, "<span background=\"#005885\"><span color=\""..beautiful.fg_focus.."\">"..date_format.."</span></span>", 60)
naughty.config.presets.normal.border_color= beautiful.border_normal
function displayMonth(month,year,weekStart)
	local t,wkSt=os.time{year=year, month=month+1, day=0},weekStart or 1
	local d=os.date("*t",t)
	local mthDays,stDay=d.day,(d.wday-d.day-wkSt+1)%7

	print(mthDays .."\n" .. stDay)
	local lines = "    "

	for x=0,6 do
		lines = lines .. os.date("%a ",os.time{year=2006,month=1,day=x+wkSt})
	end

	lines = lines .. "\n" .. os.date(" %V",os.time{year=year,month=month,day=1})

	local writeLine = 1
	while writeLine < (stDay + 1) do
		lines = lines .. "    "
		writeLine = writeLine + 1
	end

	for d=1,mthDays do
		local x = d
		local t = os.time{year=year,month=month,day=d}
		if writeLine == 8 then
			writeLine = 1
			lines = lines .. "\n" .. os.date(" %V",t)
		end
		if os.date("%Y-%m-%d") == os.date("%Y-%m-%d", t) then
			x = "<u>" .. d .. "</u>"
		end
		if (#(tostring(d)) == 1) then
			x = " " .. x
		end
		lines = lines .. "  " .. x
		writeLine = writeLine + 1
	end
	local header = os.date("%B %Y\n",os.time{year=year,month=month,day=1})

	return header .. "\n" .. lines
end

local calendar = {}
function switchNaughtyMonth(switchMonths)
	if (#calendar < 3) then return end
	local swMonths = switchMonths or 1
	calendar[1] = calendar[1] + swMonths
	calendar[3].box.widgets[2].text = string.format('<span font_desc="%s">%s</span>', "monospace", displayMonth(calendar[1], calendar[2], 2))
end

function switchNaughtyGoToToday()
        if (#calendar < 3) then return end
        local swMonths = switchMonths or 1
        calendar[1] = os.date("*t").month
        calendar[2] = os.date("*t").year
       switchNaughtyMonth(0)
end

datewidget:add_signal('mouse::enter', function ()
	local month, year = os.date('%m'), os.date('%Y')
	calendar = { month, year, 
	naughty.notify({
		text = string.format('<span font_desc="%s">%s</span>', "monospace", displayMonth(month, year, 2)),
		timeout = 0,
		hover_timeout = 0.5,
        position = wibox_position .. "_right",
        fg=beautiful.fg_focus,
        bg=beautiful.bg_focus,
		screen = mouse.screen
	})
}
end)
datewidget:add_signal('mouse::leave', function () naughty.destroy(calendar[3]) end)

datewidget:buttons(awful.util.table.join(
awful.button({ }, 1, function()
	switchNaughtyMonth(-1)
end),
awful.button({ }, 2, switchNaughtyGoToToday),
awful.button({ }, 3, function()
	switchNaughtyMonth(1)
end),
awful.button({ }, 4, function()
	switchNaughtyMonth(-1)
end),
awful.button({ }, 5, function()
	switchNaughtyMonth(1)
end),
awful.button({ 'Shift' }, 1, function()
	switchNaughtyMonth(-12)
end),
awful.button({ 'Shift' }, 3, function()
	switchNaughtyMonth(12)
end),
awful.button({ 'Shift' }, 4, function()
	switchNaughtyMonth(-12)
end),
awful.button({ 'Shift' }, 5, function()
	switchNaughtyMonth(12)
end)
))
------------------------------------------------------------------

-- layout menu
function layouts_menu(Layouts, args)
    args = args or {}
    args.width = args.width or theme.menu_width
    local items = {}
    local theme = beautiful.get()
    for _, layout in ipairs(Layouts) do
        local layout_name = awful.layout.getname(layout)
        table.insert(items, { layout_name,
            function ()
                awful.layout.set(layout)
            end,
            theme["layout_" .. layout_name] })
    end
    local menu = awful.menu({ items = items, theme = { width = args.width } })
    if args.align == "right" then
        for _, item in ipairs(menu.items) do
            item.widget:reset()
            item.widget:set_left(item.label)
            item.widget:set_right(item.icon)
        end
    end
    return menu
end
------------------------------------------------------------------

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mylayoutmenu = layouts_menu(layouts)
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button( k_m , 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button( k_m, 3, function(t) menu.create.tags(nil, t) end),
                    awful.button({ }, 8, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
                    
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1,
			function (c)
			if not c:isvisible() then awful.tag.viewonly(c:tags()[1]) end
				if client.focus == c then
				c.minimized = not c.minimized
				else
				client.focus = c
				c:raise()
				end
			end
			),
			awful.button({ }, 2, function (c) c:kill() end),
			awful.button({ }, 3,
			function (c)
			if instance then
				instance:hide()
				instance = nil
				else
				instance = menu.create.clients(nil, c)
				end
			end
			),
			awful.button({ }, 4,
				function ()
				awful.client.focus.byidx(1)
				if client.focus then client.focus:raise() end
				end
			),
			awful.button({ }, 5,
				function ()
				awful.client.focus.byidx(-1)
				if client.focus then client.focus:raise() end
				end
			)
)
for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 2, function () mylayoutmenu:toggle() end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

-- Tasklist ----------------------------------------------------------------------------------
if tasklist_icon_enable then
	mytasklist[s] = awful.widget.tasklist(function(c)
	return awful.widget.tasklist.label.currenttags(c, s)
	end, mytasklist.buttons)
else
	mytasklist[s] = awful.widget.tasklist(function(c)
		--remove tasklist-icon without modifying the original tasklist.lua
		local tmptask = { awful.widget.tasklist.label.currenttags(c, s) }
		return tmptask[1], tmptask[2], tmptask[3], nil
	end, mytasklist.buttons)
end


-- {{{ CPU usage

-- check for cpugraph_enable == true in config
cpuwidget = widget({ type = "textbox" })
cpu = widget ({type = "imagebox" })
cput = widget ({type = "imagebox" })
if cpu_enable then
    cpu.image = image(beautiful.widget_cpu)
    
	-- CPU widget
	vicious.register(cpuwidget, vicious.widgets.cpu,
		function (widget, args)
            if args[1] >= 50 and args[1] <= 75 then
                    return "<span color=\"#bfbfbf\">".. args[1] .. "%</span>"
            elseif args[1] > 75 then
                    return "<span color=\"#900000\">".. args[1] .. "%</span>"
            else
                    return "<span color=\"#005885\">".. args[1] .. "%</span>"
            end
		end )
	cpuwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )	
end

popups.htop(cpuwidget,{title_color = "#00FF00", user_color = "#0000FF", root_color="#FF0000", font='DroidSansMono 7'})

-- temperature
tzswidget = widget({ type = "textbox" })
if cputemp_enable then
	vicious.register(tzswidget, vicious.widgets.thermal,
		function (widget, args)
			if args[1] > 0 then
				tzfound = true
                cput.image = image(beautiful.widget_temp)
				return " <span color=\""..beautiful.fg_normal.."\">".. args[1] .. "C°</span>"
			else return "" 
			end
		end
		, 19, "thermal_zone0")
end
-- }}}

-- {{{ Memory usage

-- Initialize widget
memwidget = widget({ type = "textbox" })
memicon = widget ({type = "imagebox" })
if mem_enable then
    memicon.image = image(beautiful.widget_mem)
	-- Memory usage (progress bar) -----------------------------------------
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, 
	function (widget, args)
        return "<span background=\"#005885\" ><span color=\""..beautiful.fg_focus.."\">".. args[1] .. "%</span></span>"
	end, 59)
end
-- {{{ Filesystem widgets

-- fs
  fsr = widget({ type = "textbox" })
fsicon = widget ({type = "imagebox" })
-- Enable caching
vicious.cache(vicious.widgets.fs)
-- Register widgets

if diskroot_enable then
    fsicon.image = image(beautiful.widget_hdd)
	vicious.register(fsr, vicious.widgets.fs,
	function (widget, args)
		if args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
            return "<span color=\"orange\"".. args["{/ used_p}"] .. "% used</span>"
		elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
            return "<span color=\"purple\">".. args["{/ used_p}"] .. "% used</span>"
		elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
			naughty.notify({ 
				title = "Disks Warning", 
				text = "No more space left on root partition!\nClean up your disk.", 
				timeout = 10, position = "top_right", 
				fg = beautiful.fg_urgent, 
				bg = beautiful.bg_urgent 
			})
            return "<span color=\""..beautiful.fg_urgent.."\">".. args["{/ used_p}"] .. "% used</span>"
        else
            return "<span color=\"#bfbfbf\">".. args["{/ used_p}"] .. "% used</span>"
		end
	end, 621)
end

popups.disk(fsr,{ title_color = "#00FF00", font="DroidSansMono 7"})

-- }}}

-- {{{ Battery state

-- Initialize widget
batwidget = widget({ type = "textbox" })
baticon = widget ({type = "imagebox" })
if battery_enable then
    baticon.image = image(beautiful.widget_battery)
    --Battery name detection
    local cmd = "ls -1 /sys/class/power_supply/"
    local f = io.popen(cmd)
    local fh = ""
    for l in f:lines() do
        local fh= io.open("/sys/class/power_supply/".. l .."/present", "r")
        if fh == nil then
        else
            Battery = l
        end
    end
    f:close()

    -- Register widget
    vicious.register(batwidget, vicious.widgets.bat,
        function (widget, args)
            if args[2] == 0 then return "<span background=\"#005885\" ><span color=\""..beautiful.fg_urgent.."\">NoBat</span></span>"
            else
                if args[2] < 15 then
                    naughty.notify({
                    title = "Warning Battery",
                    text = "Low Battery ! "..args[2].."% .",
                    timeout = 10,
                    fg = beautiful.fg_urgent,
                    bg = beautiful.bg_urgent
                    })
                end
                return "<span background=\"#005885\" ><span color=\""..beautiful.fg_focus.."\">".. args[2] .. "%</span></span>"
            end
        end, 61, Battery
    )
end
-- }}}


-- {{{ Volume level
-- Sound Control
volwidget = widget({ type = "textbox" })
volicon = widget ({type = "imagebox" })
if vol_enable then
    vicious.register(volwidget, vicious.widgets.volume, 
    function (widget, args)
        if args[1] == 0 or args[2] == "♩" then
            volicon.image = image(beautiful.widget_vol_no)
            return "<span background=\"#005885\" ><span color=\""..beautiful.fg_focus.."\">muted </span></span>"
        else
            volicon.image = image(beautiful.widget_vol)
            return "<span background=\"#005885\" ><span color=\""..beautiful.fg_focus.."\">".. args[1] .. "% </span></span>"
        end
    end, 2, "Master")
volwidget:buttons(awful.util.table.join(
    awful.button({ }, 3, function () awful.util.spawn("urxvtcd -e alsamixer") end),
    awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
    awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2%+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2%-", false) end)
 ))
end
-- }}}

musicicon = widget ({type = "imagebox" })
-- Enable mocp*	
tb_moc = widget({ type = "textbox", align = "right" })

	function moc_control (action)
		local moc_info,moc_state
		 
		if action == "next" then
			io.popen("mocp --next")
		elseif action == "previous" then
			io.popen("mocp --previous")
		elseif action == "stop" then
			io.popen("mocp --stop")
		elseif action == "play_pause" then
			moc_info = io.popen("mocp -i"):read("*all")
			moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
		 
			if moc_state == "PLAY" then
				io.popen("mocp --pause")
			elseif moc_state == "PAUSE" then
				io.popen("mocp --unpause")
			elseif moc_state == "STOP" then
				io.popen("mocp --play")
			end
		end
	end

	function hook_moc()
    fpid = io.popen("pgrep -o mocp")
    pid = fpid:read("*n")
	fpid:close()

		  if pid then
		   moc_info = io.popen("mocp -i"):read("*all")
		   moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
		   if moc_state == "PLAY" or moc_state == "PAUSE" then
			   moc_artist = string.gsub(string.match(moc_info, "Artist: %C*"), "Artist: ","")
			   moc_title = string.gsub(string.match(moc_info, "SongTitle: %C*"), "SongTitle: ","")
			   moc_curtime = string.gsub(string.match(moc_info, "CurrentTime: %d*:%d*"), "CurrentTime: ","")
			   moc_totaltime = string.gsub(string.match(moc_info, "TotalTime: %d*:%d*"), "TotalTime: ","")
			   if moc_artist == "" then
				   moc_artist = "unknown artist"
			   end
			   if moc_title == "" then
				   moc_title = "unknown title"
			   end
				-- moc_title = string.format("%.5c", moc_title)
			   moc_string = "<span color=\""..beautiful.fg_normal.."\"> "..moc_artist .. " - " .. moc_title .. "</span>"
			   if moc_state == "PAUSE" then
				   moc_string = "<span color=\""..beautiful.fg_normal.."\"> -PAUSE- " .. moc_string .. "</span>"
			   end
           else
			   moc_string = "<span color=\""..beautiful.fg_normal.."\"> -=not playing=- </span>"
		   end
	else
		   moc_string = "<span color=\""..beautiful.fg_normal.."\"> </span>"
		  end
		  return moc_string
	end
if moc_enable then	 
musicicon.image = image(beautiful.widget_music)
	-- refresh Moc widget
	moc_timer = timer({timeout = 1})
	moc_timer:add_signal("timeout", function() tb_moc.text = hook_moc()  end)
	moc_timer:start()

	--moc widget buttons
	tb_moc:buttons(awful.util.table.join(
	awful.button({ }, 1, function () moc_control("play_pause") end),
	awful.button({ }, 2, function () awful.util.spawn ("urxvtcd -T moc -e mocp") end),
    awful.button({ }, 3, function () moc_control("stop") end),
	awful.button({ }, 4, function () moc_control("next") end),
	awful.button({ }, 5, function () moc_control("previous") end)	
	))
end
--}}}

--{{{ cmus widget
-- Get cmus PID to check if it is running
function getCmusPid()
  local fpid = io.popen("pgrep cmus")
  local pid = fpid:read("*n")
  fpid:close()
  return pid
end

-- Enable cmus control
function cmus_control (action)
  local cmus_info, cmus_state
  local cmus_run = getCmusPid()
  if cmus_run then
      cmus_info = io.popen("cmus-remote -Q"):read("*all")
      cmus_state = string.gsub(string.match(cmus_info, "status %a*"),"status ","")
      if cmus_state ~= "stopped" then
          if action == "next" then
              io.popen("cmus-remote -n")
          elseif action == "previous" then
              io.popen("cmus-remote -r")
          elseif action == "stop" then
              io.popen("cmus-remote -s")
          end
      end
      if action == "play_pause" then
          if cmus_state == "playing" or cmus_state == "paused" then
              io.popen("cmus-remote -u")
          elseif cmus_state == "stopped" then
              io.popen("cmus-remote -p")
          end
      end
  end
end

-- Cmus Widget
tb_cmus = widget({ type = "textbox", align = "right" })
function hook_cmus()
  -- check if cmus is running
  local cmus_run = getCmusPid()
  if cmus_run then
      cmus_info = io.popen("cmus-remote -Q"):read("*all")
      cmus_state = string.gsub(string.match(cmus_info, "status %a*"),"status ","")
      if cmus_state == "playing" or cmus_state == "paused" then
          cmus_artist = string.gsub(string.match(cmus_info, "tag artist %C*"), "tag artist ","")
          cmus_title = string.gsub(string.match(cmus_info, "tag title %C*"), "tag title ","")
          cmus_curtime = string.gsub(string.match(cmus_info, "position %d*"), "position ","")
          cmus_curtime_formated = math.floor(cmus_curtime/60) .. ':' .. string.format("%02d",cmus_curtime % 60)
          cmus_totaltime = string.gsub(string.match(cmus_info, "duration %d*"), "duration ","")
          cmus_totaltime_formated = math.floor(cmus_totaltime/60) .. ':' .. string.format("%02d",cmus_totaltime % 60)
          if cmus_artist == "" then
              cmus_artist = "unknown artist"
          end
          if cmus_title == "" then
              cmus_title = "unknown title"
          end
          -- cmus_title = string.format("%.5c", cmus_title)
          cmus_string = "<span color=\""..beautiful.fg_normal.."\" size=\"small\"> "..cmus_artist .. " - " .. cmus_title .. "</span>"
          if cmus_state == "paused" then
              cmus_string = "<span color=\""..beautiful.fg_normal.."\" size=\"small\"> -PAUSE- "  .. cmus_string .. "</span>"
          else
              cmus_string = '\> ' .. cmus_string .. ''
          end
      else
          cmus_string = "<span color=\""..beautiful.fg_normal.."\" size=\"small\"> -=not playing=- </span>"
      end
      return cmus_string
  else
      return "<span color=\""..beautiful.fg_normal.."\" size=\"small\"> </span>"
  end
end

if cmus_enable then
 musicicon.image = image(beautiful.widget_music)
    -- refresh Cmus widget
    cmus_timer = timer({timeout = 1})
    cmus_timer:add_signal("timeout", function() tb_cmus.text = "<span color=\""..beautiful.bg_focus.."\" size=\"small\">CMUS ".. hook_cmus() .."</span>"  end)
    cmus_timer:start()
end
--}}}

--{{{ uptime widget
uptime = widget({ type = "textbox" })
if uptime_enable then
	uptime_t = awful.tooltip({ objects = { uptime },})
	vicious.register(uptime, vicious.widgets.uptime,
	function (widget, args)
	uptime_t:set_text("Load : [".. args[4] .."/".. args[5] .."/".. args[6] .."]")
    return "<span background=\"#005885\" ><span color=\""..beautiful.fg_focus.."\">".. args[1] .. "d " .. args[2] .. "h " .. args[3] .. "m</span></span>"
	end,60)
end
--}}}

--{{{Network widget
net = widget({ type = "textbox" })
neticon = widget ({type = "imagebox" })
if net_enable then
    neticon.image = image(beautiful.widget_net)
	vicious.register(net, vicious.widgets.net,
	function (widget, args)
		local out = ""
		for line in io.lines("/proc/net/dev") do
			local name = string.match(line, "^[%s]?[%s]?[%s]?[%s]?([%w]+):")
			local received = tonumber(string.match(line, ":[%s]*([%d]+)"))
			if name ~= nil then
				if name ~= "lo" then
					if received ~= 0 then
						out = out .. " <span color=\""..beautiful.fg_normal.."\">" .. name .."</span> <span color=\"orange\" size=\"x-small\">up </span><span color=\"orange\" size=\"small\">" .. args["{" .. name .." up_kb}"] .. "KB</span> / <span color=\"green\" size=\"small\">" .. args["{" .. name .." down_kb}"] .. "KB</span><span color=\"green\" size=\"x-small\"> dn</span>"
					end
				end
			end
		end
        return out
	end, 1)
end

popups.netstat(net,{ title_color = "#00FF00", established_color= "#0000FF", listen_color="#FF0000", font="DroidSansMono 7"})
--}}}

--{{{ Mail widget
-- put your gmail credentials in ~/.netrc file
-- syntax :
-- #machine mail.google.com login <e-mail address> password <password>
mailicon = widget ({type = "imagebox" })
mygmail = widget({ type = "textbox" })
gmail_t = awful.tooltip({ objects = { mygmail },})
if gmail_enable then
    mailicon.image = image(beautiful.widget_mail)
	vicious.register(mygmail, vicious.widgets.gmail,
					function (widget, args)
						gmail_t:set_text(args["{subject}"])
                        return "<span color=\""..beautiful.fg_normal.."\">".. args["{count}"] .. "</span>"
					 end, 120)
					 --the '120' here means check every 2 minutes.
	mygmail:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( webgui .. " https://mail.google.com") end ) ) )
end
--}}}


--{{{ Apt Widget
aptwidget = widget({type = "textbox"})
debianicon = widget ({type = "imagebox" })
if apt_enable then
    debianicon.image = image(beautiful.widget_debian)
    aptwidget_t = awful.tooltip({ objects = { aptwidget},})
	vicious.register(aptwidget, vicious.widgets.pkg,
					function(widget,args)
						local io = { popen = io.popen }
						local s = io.popen("apt-show-versions -u -b")
						local str = ''

						for line in s:lines() do
							str = str .. line .. "\n"
						end
						aptwidget_t:set_text(str)
						s:close()
                        return "<span background=\"#005885\" ><span color=\""..beautiful.fg_focus.."\">".. args[1] .. "</span></span>"
					end, 1800, "Debian")

					--'1800' means check every 30 minutes
     aptwidget:buttons(awful.util.table.join(awful.button({}, 3, function () awful.util.spawn ( "urxvtcd -T update -e sudo aptitude update") end )) )
end
--}}}

--{{ Weather widget
-- Weather Widget ----------------------
weatherwidget = widget({ type = "textbox" })
weathericon = widget ({type = "imagebox" })
if weather_enable then 
    weathericon.image = image(beautiful.widget_weather)
	weather_t = awful.tooltip({ objects = { weatherwidget },})
	vicious.register(weatherwidget, vicious.widgets.weather,
					function (widget, args)
						weather_t:set_text("City: " .. args["{city}"] .."\nWind: " .. args["{windkmh}"] .. "km/h " .. args["{wind}"] .. "\nSky: " .. args["{sky}"] .. "\nHumid: " .. args["{humid}"] .. "%")
                        return "<span color=\""..beautiful.fg_normal.."\">".. args["{tempc}"] .. "C</span>"
					end, 1800, weather_code)
					--'1800': check every 30 minutes.
					--'LFMK': the Carcassonne ICAO code.

	weatherwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( webgui .. " http://www.meteociel.fr/") end ) ) )                
end
--}}


--==============================================================--

-- PANEL CREATION --

--==============================================================--
-- Panel Config ----------------------------------------------

	mywibox[s] = awful.wibox({
		   position = wibox_position,
		   screen = s,
		   height = "14",
		   border_color = beautiful.border_panel,
		   border_width = beautiful.border_width,
            opacity = wibox_opacity
	 })

--------------------------------------------------------------

 mywibox[s].widgets = {
        {
            spacer, mylauncher,spacer, mytaglist[s],mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        spacer,mylayoutbox[s],
        arrl_dl,arrl_ld,
        s == 1 and mysystray or nil,
        arrl_dl,datewidget,bluespacer,calicon,arrl_ld,
        spacer,weatherwidget,weathericon,spacer,
        arrl_dl,uptime,bluespacer,arrl_ld,
		spacer,mygmail,mailicon,spacer,
        arrl_dl,aptwidget,bluespacer,debianicon,arrl_ld, 
        spacer,net,neticon,spacer,
        arrl_dl,volwidget,bluespacer,volicon,arrl_ld,
        spacer,tb_moc,tb_cmus,musicicon,spacer,
        arrl_dl,batwidget,bluespacer,baticon,arrl_ld,
        spacer,fsr,fsicon,spacer,
        arrl_dl,memwidget,memicon,bluespacer,arrl_ld, 
        spacer,tzswidget, cput,cpuwidget,cpu,spacer,
        arrl_dl,arrl_ld,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}
--Aphelion@2013--------------------------------------------------------
