--[[
Conky Widgets by londonali1010 (2009)

This script is meant to be a "shell" to hold a suite of widgets for use in Conky.

To configure:
+ Copy the widget's code block (will be framed by --(( WIDGET NAME )) and --(( END WIDGET NAME )), with "[" instead of "(") somewhere between "require 'cairo'" and "function conky_widgets()", ensuring not to paste into another widget's code block
+ To call the widget, add the following just before the last "end" of the entire script:
    cr = cairo_create(cs)
    NAME_OF_FUNCTION(cr, OPTIONS)
    cairo_destroy(cr)
+ Replace OPTIONS with the options for your widget (should be specified in the widget's code block) 

Call this script in Conky using the following before TEXT (assuming you save this script to ~/scripts/conky_widgets.lua):
    lua_load ~/scripts/conky_widgets.lua
    lua_draw_hook_pre widgets

Changelog:
+ v1.0 -- Original release (17.10.2009)
]]

require 'cairo'

function conky_widgets()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)

    cr = cairo_create(cs)
    gradient_ring(cr, 'time', '%I', 12, 0xf7cd5f, 1.0, 90, 90, 45, 60, 2, 4, 0, 360)
    cairo_destroy(cr)

    cr = cairo_create(cs)
    gradient_ring(cr, 'time', '%M', 60, 0xffffff, 0.8, 90, 90, 65, 75, 2, 2, 0, 360)
    cairo_destroy(cr)
    
    cr = cairo_create(cs)
    gradient_ring(cr, 'time', '%S', 60, 0xffffff, 0.6, 90, 90, 80, 85, 2, 2, 0, 360)
    cairo_destroy(cr)
end

--[[ GRADIENT RING WIDGET ]]
--[[ Options (name, arg, max, colour, alpha, x, y, inner_radius, outer_radius, frac, thickness, start_angle, end_angle):
        "name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
        "arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. If you would not use an argument in the Conky variable, use ''.
        "max" is the maximum value of the ring. If the Conky variable outputs a percentage, use 100.
        "fg_colour" is the colour of the ring.
        "fg_alpha" is the alpha value of the ring.
        "x" and "y" are the x and y coordinates of the centre of the ring, relative to the top left corner of the Conky window.
        "inner_radius" is the inner radius of the ring.
        "outer_radius" is the outer radius of the ring.  
        "frac" determines the extent of the gradient around the ring - 2 implies the gradient fades halfway around the ring, 4 equals a quarter of the way, etc...      
        "thickness" is the thickness of the ring, centred around the radius.
        "start_angle" is the starting angle of the ring, in degrees, clockwise from top. Value can be either positive or negative.
        "end_angle" is the ending angle of the ring, in degrees, clockwise from top. Value can be either positive or negative, but must be larger (e.g. more clockwise) than start_angle. ]]
     
function gradient_ring(cr, name, arg, max, fgc, fga, xc, yc, ring_i, ring_o, frac, t, sa, ea)
        local function rgb_to_r_g_b(colour,alpha)
            return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
        end
     
        local function draw_gradient_ring(pct)
            local angle_0=sa*(2*math.pi/360)-math.pi/2
            local angle_f=ea*(2*math.pi/360)-math.pi/2
            local pct_arc=pct*(angle_f-angle_0)
     
            for i = 1,max/frac do
                cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga*i/max)) --for flat shading of bars
        
                cairo_move_to(cr,xc-ring_i*math.cos(angle_0+pct_arc+2*math.pi*i/max),yc-ring_i*math.sin(angle_0+pct_arc+2*math.pi*i/max))
                cairo_line_to(cr,xc-ring_o*math.cos(angle_0+pct_arc+2*math.pi*i/max),yc-ring_o*math.sin(angle_0+pct_arc+2*math.pi*i/max))
    
                cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
                cairo_set_line_width(cr,t)
                cairo_stroke(cr)
            end
        end
     
        local function setup_gradient_ring()
            local str = ''
            local value = 0
     
            str = string.format('${%s %s}', name, arg)
            str = conky_parse(str)
     
            value = tonumber(str)
            if value == nil then value = 0 end
            pct = value/max
     
            draw_gradient_ring(pct)
        end    
     
        local updates=conky_parse('${updates}')
        update_num=tonumber(updates)
     
        if update_num>5 then setup_gradient_ring() end
    end
     
--[[ END GRADIENT RING WIDGET ]]
