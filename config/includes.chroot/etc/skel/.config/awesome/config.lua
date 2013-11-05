-- minimal awesome config file -----------------------------------------
-- allow you to: - set your screenshot directory
--               - display the awesome menu icon
--               - select the awesome menu language
--               - set your taglist behaviour
--               - enable/disqble client titlebar
--               - set your statusbar type & position
--               - set your date format
--               - enable/disable widgets
------------------------------------------------------------------------

-- folders
screenshots = home .. "/tmp/"

--awesome menu
menu_icon = true --if true the Awesome menu icon will show on top left corner menu still accessible with right clic and Alt+p
menu_lang = "en" --support fr and en

--taglists
taglist = "static" --support static/dynamic
-- if static select taglists_type
taglist_style = "arabic" -- we support arabic (1,2,3...),east_arabic (١, ٢, ٣,...), persian_arabic(٠,١,٢,٣,۴,....}, roman (I, II, III, IV,)

--clients
enable_titlebar = false --enable clients titlebar
enable_floatbar = false --enable clients titlebar only when client is floating
tasklist_icon_enable = false --enable client tasklist icons

--wibox:
widget_mode = "simple" --support simple/arrow (simple have no popups-no graph-no pics)
wibox_position = "bottom" --support top/bottom
wibox_opacity = 1 --wibox bar opacity (transparency between 0 and 1)

--date widget
date_format = "%b,%d %H:%M" -- refer to http://en.wikipedia.org/wiki/Date_(Unix) specifiers

--cpu widget
cpu_enable = true -- Show CPU info
cputemp_enable = true --Show CPU temp (if enable but not showing cputemp, your sensors are not recognize)

--mem widget
mem_enable = true -- Show memory bar

--disk widget
diskroot_enable = true --show root partition usage

--system
uptime_enable = false -- show uptime and load

--network widget
net_enable = true --show net traffic
apt_enable = true --show apt update if any (need "apt-show-versions" to be installed)
gmail_enable = false --show unread mail in gmail box (need ~/.netrc with -> machine mail.google.com login <e-mail address> password <password>)
weather_enable = false --show weather info
weather_code = "LFPO" --if show weather is enable use this code

--volume widget
vol_enable = true --enable volume widget

--bat widget
battery_enable = true -- Show battery state

--moc widget
moc_enable = true
cmus_enable = false

--Aphelion@2013---------------------------------------------------------
