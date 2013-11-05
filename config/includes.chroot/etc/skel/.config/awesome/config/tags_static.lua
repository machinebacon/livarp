-- Window management layouts ---------
layouts = 
{
  awful.layout.suit.tile,        -- 1
  awful.layout.suit.tile.bottom, -- 2
  awful.layout.suit.fair,        -- 3
  awful.layout.suit.max,         -- 4
  awful.layout.suit.magnifier,   -- 5
  awful.layout.suit.floating     -- 6
}
--------------------------------------


tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
if taglist_style == 'east_arabic' then
		shifty.config.tags = {
			["١"]   = { position = 1,  init = true, layout = layouts[1]},
			["٢"]   = { position = 2,  nopopup = true, init = true, layout = layouts[2]},
			["٣"]   = { position = 3,  nopopup = true, init = true, layout = layouts[3]},
			["٤"]   = { position = 4,  nopopup = true, init = true, layout = layouts[4]},
			["٥"]   = { position = 5,  nopopup = true, init = true, layout = layouts[5]},
			["٦"]   = { position = 6,  nopopup = true, init = true, layout = layouts[6]},
			["٧"]   = { position = 7,  nopopup = true, init = true, layout = layouts[2]},
			["٨"]   = { position = 8,  nopopup = true, init = true, layout = layouts[2]},
			["٩"]   = { position = 9,  nopopup = true, init = true, layout = layouts[2]},
		}
	elseif taglist_style == 'persian_arabic' then
		shifty.config.tags = {
			["٠"]   = { position = 1,  init = true, layout = layouts[1]},
			["١"]   = { position = 2,  nopopup = true, init = true, layout = layouts[2]},
			["٢"]   = { position = 3,  nopopup = true, init = true, layout = layouts[3]},
			["٣"]   = { position = 4,  nopopup = true, init = true, layout = layouts[4]},
			["۴"]   = { position = 5,  nopopup = true, init = true, layout = layouts[5]},
			["۵"]   = { position = 6,  nopopup = true, init = true, layout = layouts[6]},
			["۶"]   = { position = 7,  nopopup = true, init = true, layout = layouts[2]},
			["٧"]   = { position = 8,  nopopup = true, init = true, layout = layouts[2]},
			["٨"]   = { position = 9,  nopopup = true, init = true, layout = layouts[2]},
			["٩"]   = { position = 10,  nopopup = true, init = true, layout = layouts[2]},
		}
	elseif taglist_style == 'roman' then
		shifty.config.tags = {
			["I"]   = { position = 1,  init = true, layout = layouts[1]},
			["II"]   = { position = 2,  nopopup = true, init = true, layout = layouts[2]},
			["III"]   = { position = 3,  nopopup = true, init = true, layout = layouts[3]},
			["IV"]   = { position = 4,  nopopup = true, init = true, layout = layouts[4]},
			["V"]   = { position = 5,  nopopup = true, init = true, layout = layouts[5]},
			["VI"]   = { position = 6,  nopopup = true, init = true, layout = layouts[6]},
			["VII"]   = { position = 7,  nopopup = true, init = true, layout = layouts[2]},
			["VIII"]   = { position = 8,  nopopup = true, init = true, layout = layouts[2]},
			["IX"]   = { position = 9,  nopopup = true, init = true, layout = layouts[2]},
			["X"]   = { position = 10,  nopopup = true, init = true, layout = layouts[2]},
		}
	else
		shifty.config.tags = {
			["1"]   = { position = 1,  init = true, layout = layouts[1]},
			["2"]   = { position = 2,  nopopup = true, init = true, layout = layouts[2]},
			["3"]   = { position = 3,  nopopup = true, init = true, layout = layouts[3]},
			["4"]   = { position = 4,  nopopup = true, init = true, layout = layouts[4]},
			["5"]   = { position = 5,  nopopup = true, init = true, layout = layouts[5]},
			["6"]   = { position = 6,  nopopup = true, init = true, layout = layouts[6]},
			["7"]   = { position = 7,  nopopup = true, init = true, layout = layouts[2]},
			["8"]   = { position = 8,  nopopup = true, init = true, layout = layouts[2]},
			["9"]   = { position = 9,  nopopup = true, init = true, layout = layouts[2]},
		}
	end
end

-- client rules --
dofile(config_dir .."/config/rules_static.lua")
----------

-- SHIFTY: default tag creation rules
-- parameter description
--  * floatBars : if floating clients should always have a titlebar
--  * guess_name : should shifty try and guess tag names when creating
--                 new (unconfigured) tags?
--  * guess_position: as above, but for position parameter
--  * run : function to exec when shifty creates a new tag
--  * all other parameters (e.g. layout, mwfact) follow awesome's tag API
shifty.config.defaults = {
    layout = awful.layout.suit.tile,
    ncol = 1,
    mwfact = 0.60,
    guess_name = true,
    guess_position = true,
}
--focus on client hovering
--shifty.config.sloppy = true
--titlebar only on floating client
shifty.config.float_bars = enable_floatbar
--shifty.config.honorsizehints = false

-- Aphelion@2013--------------------------------------------------------
