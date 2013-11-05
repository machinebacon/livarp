-- topbars.lua
-- arpinux@2012
------------------------------------------------------------------------
require 'cairo'

-- table ---------------------------------------------------------------
settings_table={
{
    name='cpu',
    arg='cpu0',
    max=100,
    x=0,
    y=0,
    title='CPU',
},
{
    name='memperc',
    arg='',
    max=100,
    x=30,
    y=0,
    title='MEM',
},
{
    name='fs_used_perc',
    arg='/',
    max=100,
    x=60,
    y=0,
    title='HDD',
},
{
    name='acpitemp',
    arg='',
    max=90,
    x=90,
    y=0,
    title='Tcpu',
},
{
    name='time',
    arg='%I',
    max=12,
    x=120,
    y=0,
    title='Hour',
},
{
    name='time',
    arg='%M',
    max=60,
    x=150,
    y=0,
    title='Mins',
},
{
    name='time',
    arg='%S',
    max=60,
    x=180,
    y=0,
    title='Secs',
},
}
-- end of table --------------------------------------------------------

-- draw bar ------------------------------------------------------------
function draw_bar(pct, pt)
    local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr=cairo_create(cs)
-- lua draw start geometry
    local gx=5
    local gy=40
-- set color white & position
    cairo_set_source_rgba (cr,1,1,1,1)
    cairo_move_to(cr,pt['x']+gx,pt['y']+gy-5)
-- define & display text
	cairo_show_text(cr,pt['title'])
	cairo_stroke(cr)
-- colors fix & gradient -----------------------------------------------
-- cpu gradient ----------------------------------------------------
    if (pt['arg'] == 'cpu0' and pct>=80) then
    -- +80% -- red opacity 8 ---------------------------------------
            cairo_set_source_rgba (cr,1,0,0.2,0.8)
        elseif (pt['arg'] == 'cpu0' and pct>30 and pct<80) then
    -- 30~80% -- orange opacity 7 ----------------------------------
            cairo_set_source_rgba (cr,1,0.5,0.3,0.7)
        elseif (pt['arg'] == 'cpu0' and pct<30) then
    -- -30% -- green opacity 4 -------------------------------------
            cairo_set_source_rgba (cr,0,1,0.6,0.4)
-- mem gradient ----------------------------------------------------
    elseif (pt['name'] == 'memperc' and pct>=60) then
    -- +60% -- red opacity 8 ---------------------------------------
            cairo_set_source_rgba (cr,1,0,0.2,0.8)
        elseif (pt['name'] == 'memperc' and pct>40 and pct<60) then
    -- 40~60% -- orange opacity 6 ----------------------------------
            cairo_set_source_rgba (cr,1,0.5,0.3,0.6)
        elseif (pt['name'] == 'memperc' and pct<40) then
    -- -40% -- light green opacity 4 -------------------------------
            cairo_set_source_rgba (cr,0,1,0.1,0.4)
-- hdd gradient ----------------------------------------------------
    elseif (pt['arg'] == '/' and pct>=90) then
    -- +90% -- red opacity 8 ---------------------------------------
            cairo_set_source_rgba (cr,1,0,0.2,0.8)
        elseif (pt['arg'] == '/' and pct>70 and pct<90) then
    -- 70~90% -- braun opacity 6 -----------------------------------
            cairo_set_source_rgba (cr,1,0.7,0.1,0.6)
        elseif (pt['arg'] == '/' and pct<70) then
    -- -70% -- green opacity 3 -------------------------------------
            cairo_set_source_rgba (cr,0,1,0.6,0.4)
--[[ battery gradient ------------------------------------------------
    elseif (pt['arg'] == 'BAT0' and pct>=80) then
    -- +80% -- green opacity 2 -------------------------------------
            cairo_set_source_rgba (cr,0,1,0.6,0.3)
        elseif (pt['arg'] == 'BAT0' and pct>30 and pct<80) then
    -- 30~80% -- white opacity 4 -----------------------------------
            cairo_set_source_rgba (cr,1,1,1,0.4)
        elseif (pt['arg'] == 'BAT0' and pct<30) then
    -- -30% -- red opacity 8 ---------------------------------------
            cairo_set_source_rgba (cr,1,0,0.2,0.8)]]--
-- network fix color -----------------------------------------------
    -- wlan0 wifi -- sky blue opacity 7 -----------------------------
    elseif (pt['arg'] == 'wlan0') then
		cairo_set_source_rgba (cr,0,0.7,1,0.7)
    -- eth0 wired -- ocean blue opacity 8 --------------------------
    elseif (pt['arg'] == 'eth0') then
		cairo_set_source_rgba (cr,0,0.2,1,0.8)
-- network limit -- do not overflow conky geometry -----------------
    elseif (pt['arg'] == 'wlan0' and pct>100) then
		pct=100
    -- eth0 limit -- red opacity 8 -------------------------------
		cairo_set_source_rgba (cr,1,0,0.2,0.8)
    elseif (pt['arg'] == 'eth0' and pct>100) then
		pct=100
		cairo_set_source_rgba (cr,1,0,0.2,0.8)
-- temps gradient --------------------------------------------------
    elseif (pt['name'] == 'acpitemp' and pct>=70) then
    -- +70% -- red opacity 8 ---------------------------------------
            cairo_set_source_rgba (cr,1,0,0.2,0.8)
    elseif (pt['name'] == 'acpitemp' and pct>30 and pct<70) then
    -- 30~70% -- green opacity 2 -----------------------------------
            cairo_set_source_rgba (cr,0,1,0.6,0.2)
    elseif (pt['name'] == 'acpitemp' and pct<30) then
    -- -30% -- white opacity 4 -------------------------------------
            cairo_set_source_rgba (cr,1,1,1,0.4)
-- hours fix color -- white opacity 4 ------------------------------
    elseif (pt['arg'] == '%I') then
        cairo_set_source_rgba (cr,1,1,1,0.4)
-- minutes fix color -- white opacity 3 ----------------------------
    elseif (pt['arg'] == '%M') then
        cairo_set_source_rgba (cr,1,1,1,0.3)
-- seconds fix color - white opacity 2 -----------------------------
    elseif (pt['arg'] == '%S') then
        cairo_set_source_rgba (cr,1,1,1,0.2)

-- general gradient ------------------------------------------------
    else
		if pct<=50 then
		cairo_set_source_rgba (cr,0.5,0.5,0.5,0.4)
		elseif (pct>50 and pct<=80) then
		cairo_set_source_rgba (cr,0.2,0.6,0.6,0.4)
		else 
		cairo_set_source_rgba (cr,1,0,0.2,0.4)
		end
	end
-- end colors ----------------------------------------------------------

-- create bars ---------------------------------------------------------
    cairo_set_line_width (cr,1)
	cairo_rectangle (cr,pt['x']+gx,pt['y']+gy,25,pct)	
	cairo_fill_preserve (cr)
    cairo_stroke (cr)
    cairo_destroy(cr)
    cr=nil
end

function conky_bar_stats()
    local function setup_bars(pt)
        local str=''
        local value=0

        str=string.format('${%s %s}',pt['name'],pt['arg'])
        str=conky_parse(str)
    
        value=math.floor(tonumber(str))
        if value == nil then
        pct=0
        else
        pct=value*100/pt['max']
        end

        draw_bar(pct,pt)
    end

    if conky_window == nil then return end
    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)


    if update_num>5 then
        for i in pairs(settings_table) do
            setup_bars(settings_table[i])
        end
    end
end
