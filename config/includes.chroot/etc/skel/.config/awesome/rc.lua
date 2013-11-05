-- useful for debugging, marks the beginning of rc.lua exec
print("Entered awesome.lua: " .. os.time())

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
naughty = require("naughty")
-- shifty - dynamic tagging library
require("shifty")
-- Load Debian menu entries
require("debian.menu")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

--{{{ Java GUI's fix ---------------------------------------------------------------------------

awful.util.spawn_with_shell("wmname LG3D")

--variables
home       = os.getenv("HOME")
config_dir = awful.util.getdir("config")
scount = screen.count()

-- {{{ Variable definitions
-- config.lua --
print("Entering config.lua: " .. os.time())
dofile(config_dir .."/config.lua")
-------------

-- {{{ Localization
if menu_lang == "fr" then
    os.setlocale("fr_FR.UTF-8")
end
-- }}}

-- Themes define colours, icons, and wallpapers
beautiful.init(home .. "/.config/awesome/themes/livarp/theme.lua")


-- Modkeys
print("Entering modkeys.lua: " .. os.time())
dofile(config_dir .."/config/modkey.lua")


-- Preffered apps
print("Entering prefferedapps.lua: " .. os.time())
dofile(config_dir .."/config/prefferedapps.lua")

-- tags.lua --
print("Entering tags.lua: " .. os.time())
if taglist == "dynamic" then
	dofile(config_dir .."/config/tags_dynamic.lua")
else 
	dofile(config_dir .."/config/tags_static.lua")
end
-----------------------------------------

-- menu.lua --
print("Entering menu.lua: " .. os.time())
if menu_lang == "fr" then
	dofile(config_dir .."/config/menu_fr.lua")
else 
	dofile(config_dir .."/config/menu_en.lua")
end
----------

-- widgets.lua --
print("Entering widgets.lua: " .. os.time())
if widget_mode == "arrow" then
	dofile(config_dir .."/config/widgets_arrow.lua")
else
	dofile(config_dir .."/config/widgets_simple.lua")
end
----------

-- SHIFTY: initialize shifty
-- the assignment of shifty.taglist must always be after its actually
-- initialized with awful.widget.taglist.new()
shifty.taglist = mytaglist
shifty.init()


-- Mouse bindings --
print("Entering mouse.lua: " .. os.time())
dofile(config_dir .."/config/mouse.lua")


-- Key bindings --
print("Entering keys.lua: " .. os.time())
dofile(config_dir .."/config/keys.lua")


-- client signals --
print("Entering signals.lua: " .. os.time())
dofile(config_dir .."/config/signals.lua")

-- autorun apps
print("Entering autorun.lua: " .. os.time())
dofile(config_dir .."/config/autorun.lua")

-- useful for debugging, marks the beginning of rc.lua exec
print("Finish awesome.lua: " .. os.time())

--Aphelion@2013--------------------------------------------------------
