----------------------------------------------------------------------------
-- @author aphelion aphelion@vmail.me
-- @copyright 2012 aphelion
-- original popup code made by Cedlemo and published on http://awesome.naquadah.org/wiki/Blingbling
-- original menu code made by Dodo and published on https://github.com/dodo/uzful
-- @release v0.1
----------------------------------------------------------------------------
-- Examples :
-- If no args, default one will be used.
-- Font must be mono.
-- - Top Popup
--	htop(mycpuwidget)
--	OR
--	htop(mycpuwidget,{title_color = "#00FF00", user_color = "#0000FF", root_color="#FF0000", font='DroidSansMono 7'})
--
-- - Netstat Popup
--	netstat(mynetworkwidget)
--	OR
--	netstat(mynetworkwidget,{ title_color = "#00FF00", established_color= "#0000FF", listen_color="#FF0000", font="DroidSansMono 7"})
--
--	- Disks Popup
--	disk(myfswidget)
--	OR
--	disk(myfswidget,{ title_color = "#00FF00", used_color= "#FF0000", free_color="#0000FF", font="DroidSansMono 7"})
--
--	- Calendar Popup
--	cal_register(mytextclock)
--    If you don't like the default current day formating you can change it as following
--	cal_register(mytextclock, "<span color='#FF0000'><b>%s</b></span>","DroidSansMono 7","fr") -- now the current day is red and bold instead of underlined
----------------------------------------------------------------------------

--local beautiful = require("beautiful")
local naughty = require("naughty")
local os = require("os")
local awful = require("awful")
local string = require("string")

---Specific popups
module("popups")

local function colorize(string, pattern, color)
 local mystring=""
 mystring=string.gsub(string,pattern,'<span color="'..color..'">%1</span>')
 return mystring
end

local processpopup = nil
local processstats = nil
local proc_offset = 25

local function show_process_info(inc_proc_offset, title_color,user_color, root_color,font,terminal)
  local save_proc_offset = proc_offset
	proc_offset = save_proc_offset + inc_proc_offset
	processstats = awful.util.pread('/bin/ps --sort -c,-s -eo fname,user,%cpu,%mem,pid,gid,ppid,tname,label | /usr/bin/head -n '..proc_offset)
	processstats = colorize(processstats, "COMMAND", title_color)
	processstats = colorize(processstats, "USER", title_color)
	processstats = colorize(processstats, "%%CPU", title_color)
	processstats = colorize(processstats, "%%MEM", title_color)
	processstats = colorize(processstats, " PID", title_color)
	processstats = colorize(processstats, "GID", title_color)
	processstats = colorize(processstats, "PPID", title_color)
	processstats = colorize(processstats, "TTY", title_color)
	processstats = colorize(processstats, "LABEL", title_color)
	processstats = colorize(processstats, "root", root_color)
	processstats = colorize(processstats, os.getenv("USER"), user_color)
	return "<span font='"..font.."'>" .. processstats .."</span>"
end

--@param mywidget the widget
--@param args a table of arguments { title_color = "#rrggbb", user_color = "#rrggbb", root_color="#rrggbb", font="FONT 7"})
function htop(mywidget, args)
	local args = args or {}
	local title_color = args.title_color or 'white'
	local user_color = args.user_color or 'blue'
	local root_color = args.root_color or 'red'
	local font = args.font or 'Mono 7'

	processpopup=awful.tooltip({ 
		objects = { mywidget },
		timer_function = function ()
			return show_process_info(0, title_color, user_color,root_color,font,terminal)
		end,
		update_func = function ()	
			return show_process_info(0, title_color, user_color,root_color,font,terminal)	
		end,
		timeout = 4,
	})
	
	mywidget:buttons(awful.util.table.join(
	 awful.button({ }, 4, function()
	  show_process_info(-1, title_color, user_color,root_color,font,terminal)
	 end),
	 awful.button({ }, 5, function()
	  show_process_info(1, title_color, user_color,root_color,font,terminal)
	 end),
	 awful.button({ }, 1, function()
	  if args.terminal then
		awful.util.spawn_with_shell(args.terminal .. " -e htop")
	  else
		awful.util.spawn_with_shell("xterm" .. " -e htop")
	  end
     end)
    ))
end

--=== NETPOPUP ===
--It binds a colorized output of the netstat command to a widget.

local netstatpopup = nil
local netstats = nil

local function get_netinfo( my_title_color, my_established_color, my_listen_color, font)
  netstats=awful.util.pread('/bin/netstat -pa -u -t | grep -v TIME_WAIT')
  netstats=colorize(netstats,"Proto", my_title_color)
  netstats=colorize(netstats,'Recv%XQ', my_title_color)
  netstats=colorize(netstats,"Send%XQ", my_title_color)
  netstats=colorize(netstats,"Adresse locale", my_title_color)
  netstats=colorize(netstats,"Adresse distante", my_title_color)
  netstats=colorize(netstats,"Etat", my_title_color)
  netstats=colorize(netstats,"PID\/Program name", my_title_color)
  netstats=colorize(netstats,"Security Context", my_title_color)
  netstats=colorize(netstats,"ESTABLISHED", my_established_color)
  netstats=colorize(netstats,"LISTEN", my_listen_color)
  return "<span font='"..font.."'>" .. netstats .."</span>"
end

--@param mywidget the widget
--@param args a table { title_color = "#rrggbb", established_color= "#rrggbb", listen_color="#rrggbb", font="FONT 7"}
function netstat(mywidget, args)
	local args = args or {}
	local title_color = args.title_color or 'white'
	local established_color = args.established_color or 'blue'
	local listen_color = args.listen_color or 'red'
	local font = args.font or 'Mono 7'
	
	netstatpopup=awful.tooltip({ 
		objects = { mywidget },
		timer_function = function ()
			return get_netinfo(title_color, established_color, listen_color, font)
		end,
		update_func = function ()	
			return get_netinfo(title_color, established_color, listen_color, font)	
		end,
		timeout = 10,
	})
end


---Disk Usage popup
--It binds a colorized output of the df command to a widget.

local diskstats = nil

local function get_diskinfo(title_color, used_color, free_color,font)
  diskstats=awful.util.pread('/usr/bin/dfc')
  diskstats=colorize(diskstats,"FILESYSTEM", title_color)
  diskstats=colorize(diskstats,"TOTAL", title_color)
  diskstats=colorize(diskstats,"USED", title_color)
  diskstats=colorize(diskstats,"AVAILABLE", title_color)
  diskstats=colorize(diskstats,"MOUNTED ON", title_color)
  return "<span font='"..font.."'>" .. diskstats .."</span>"
end

--@param mywidget the widget
--@param args a table { title_color = "#rrggbb", used_color= "#rrggbb", free_color="#rrggbb", font="FONT 7"}
function disk(mywidget, args)
	local args = args or {}
	local title_color = args.title_color or 'white'
	local used_color = args.used_color or 'blue'
	local free_color = args.free_color or 'red'
	local font = args.font or 'Mono 7'
	
	diskpopup=awful.tooltip({ 
		objects = { mywidget },
		timer_function = function ()	
			return get_diskinfo(title_color, used_color, free_color, font) 
		end,
		update_func = function ()	
			return get_diskinfo(title_color, used_color, free_color, font) 	
		end,
		timeout= 10,
	})
end
