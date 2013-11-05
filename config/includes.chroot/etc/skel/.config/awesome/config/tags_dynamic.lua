-------------
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

-- Tags -----------------------------------------------------------------
-- Shifty configured tags.
shifty.config.tags = {
	["foo"]   = { position = 1,  init = true,   },
    ["www"]   = { position = 2,  layout=layouts[4],spawn = webgui,},
    ["irc"]   = { position = 3,  nopopup = true, },
    ["office"]= { position = 5,  exclusive = true, nopopup = true,  },
    ["gimp"]  = { position = 6,  exclusive = true, nopopup = true, spawn = gimp, },
    ["msg"]   = { position = 7,  exclusive = true, nopopup = true,  },
    ["view"]  = { position = 8,  exclusive = true, nopopup = true,  },
    ["urxvt"] = { position = 9,  init = true,  },
    ["mail"]  = { position = 10, exclusive = true, nopopup = true,  },
    ["edit"]  = { position = 11, },
    ["bt"]    = { position = 12, nopopup = true, spawn = torrent},
    ["vbox"]  = { position = 13, exclusive = true, nopopup = true,  },
}

-- client rules --
dofile(config_dir .."/config/rules_dynamic.lua")
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

--shifty.config.sloppy = true
shifty.config.float_bars = enable_floatbar
--shifty.config.honorsizehints = false

-- Aphelion@2013--------------------------------------------------------
