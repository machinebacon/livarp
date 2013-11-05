--------------------------------------
-- Default livarp_0.4 awesome theme --
--     Aphelion & arpinux @2013     --
--------------------------------------

theme = {}

theme.font          = "Droid Sans 9"
theme.bg_normal     = "#222222"
theme.bg_focus      = "#005885"
theme.bg_urgent     = "#cc5554"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#878787"
theme.fg_focus      = "#bfbfbf"
theme.fg_urgent     = "#222222"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#0f0f0f"
theme.border_focus  = "#005885"
theme.border_marked = "#91231c"


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "~/.config/awesome/themes/livarp/taglist/squarefw.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/livarp/taglist/squarew.png"

theme.tasklist_bg_normal = "#005885"
theme.tasklist_fg_normal = "#BFBFBF"
theme.tasklist_bg_focus = "#222222"
theme.tasklist_fg_focus = "#878787"
theme.tasklist_floating_icon = "~/.config/awesome/themes/livarp/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "~/.config/awesome/themes/livarp/submenu.png"
theme.menu_height = "12"
theme.menu_width  = "110"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_height = 12
theme.titlebar_close_button_normal = "~/.config/awesome/themes/livarp/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/livarp/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/livarp/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/livarp/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/livarp/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/livarp/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/livarp/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/livarp/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/livarp/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/livarp/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/livarp/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/livarp/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/livarp/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/livarp/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/livarp/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/livarp/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/livarp/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/livarp/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
--theme.wallpaper_cmd = { "awsetbg /usr/share/backgrounds/livarp_04.png" }

-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/themes/livarp/layouts/fairhw.png"
theme.layout_fairv = "~/.config/awesome/themes/livarp/layouts/fairvw.png"
theme.layout_floating  = "~/.config/awesome/themes/livarp/layouts/floatingw.png"
theme.layout_magnifier = "~/.config/awesome/themes/livarp/layouts/magnifierw.png"
theme.layout_max = "~/.config/awesome/themes/livarp/layouts/maxw.png"
theme.layout_fullscreen = "~/.config/awesome/themes/livarp/layouts/fullscreenw.png"
theme.layout_tilebottom = "~/.config/awesome/themes/livarp/layouts/tilebottomw.png"
theme.layout_tileleft   = "~/.config/awesome/themes/livarp/layouts/tileleftw.png"
theme.layout_tile = "~/.config/awesome/themes/livarp/layouts/tilew.png"
theme.layout_tiletop = "~/.config/awesome/themes/livarp/layouts/tiletopw.png"
theme.layout_spiral  = "~/.config/awesome/themes/livarp/layouts/spiralw.png"
theme.layout_dwindle = "~/.config/awesome/themes/livarp/layouts/dwindlew.png"

theme.awesome_icon = "~/.config/awesome/themes/livarp/awesome16.png"


-- powerarrow
theme.arr1    = home .."/.config/awesome/themes/livarp/powerarrow/arr1.png"
theme.arrl_dl = home .."/.config/awesome/themes/livarp/powerarrow/arrl_dl_sf.png"
theme.arrl_ld = home .."/.config/awesome/themes/livarp/powerarrow/arrl_ld_sf.png"

--icons
theme.widget_ac                             = home .."/.config/awesome/themes/livarp/powerarrow/ac.png"
theme.widget_battery                        = home .."/.config/awesome/themes/livarp/powerarrow/battery.png"
theme.widget_battery_low                    = home .."/.config/awesome/themes/livarp/powerarrow/battery_low.png"
theme.widget_battery_empty                  = home .."/.config/awesome/themes/livarp/powerarrow/battery_empty.png"
theme.widget_mem                            = home .."/.config/awesome/themes/livarp/powerarrow/mem.png"
theme.widget_cpu                            = home .."/.config/awesome/themes/livarp/powerarrow/cpu_clear.png"
theme.widget_temp                           = home .."/.config/awesome/themes/livarp/powerarrow/temp.png"
theme.widget_net                            = home .."/.config/awesome/themes/livarp/powerarrow/net.png"
theme.widget_hdd                            = home .."/.config/awesome/themes/livarp/powerarrow/hdd_clear.png"
theme.widget_music                          = home .."/.config/awesome/themes/livarp/powerarrow/music.png"
theme.widget_vol                            = home .."/.config/awesome/themes/livarp/powerarrow/vol.png"
theme.widget_vol_low                        = home .."/.config/awesome/themes/livarp/powerarrow/vol_low.png"
theme.widget_vol_no                         = home .."/.config/awesome/themes/livarp/powerarrow/vol_mute.png"
theme.widget_vol_mute                       = home .."/.config/awesome/themes/livarp/powerarrow/vol_mute.png"
theme.widget_mail                           = home .."/.config/awesome/themes/livarp/powerarrow/mail.png"
theme.widget_debian                         = home .."/.config/awesome/themes/livarp/powerarrow/debian.png"
theme.widget_weather                        = home .."/.config/awesome/themes/livarp/powerarrow/sun.png"
theme.widget_cal                            = home .."/.config/awesome/themes/livarp/powerarrow/cal.png"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
