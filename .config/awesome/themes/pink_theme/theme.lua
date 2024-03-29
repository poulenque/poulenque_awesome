---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "fixed 7"

--theme.bg_normal     = "#222222"
--theme.bg_focus      = "#535d6c"
--theme.bg_urgent     = "#ff0000"
--theme.bg_minimize   = "#444444"

--theme.fg_normal     = "#aaaaaa"
--theme.fg_focus      = "#ffffff"
--theme.fg_urgent     = "#ffffff"
--theme.fg_minimize   = "#ffffff"

--theme.border_width  = "1"
--theme.border_normal = "#000000"
--theme.border_focus  = "#535d6c"
--theme.border_marked = "#91231c"

theme.bg_normal     = "#ffaaaa"
theme.bg_focus      = "#ffcccc"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#aa00aa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#333333"
theme.border_focus  = "#ffaaaa"
theme.border_marked = "#91231c"

path = awful.util.getdir("config") .. "/themes/pink_theme"


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
theme.taglist_squares_sel   = path .. "/taglist/squarefw.png"
theme.taglist_squares_unsel = path .. "/taglist/squarew.png"

theme.tasklist_floating_icon = path .. "/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = path .. "/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

--====================================================================================================
-- Define the image to load
-- theme.titlebar_close_button_normal = path .. "/titlebar/close_normal.png"
-- theme.titlebar_close_button_focus  = path .. "/titlebar/close_focus.png"

-- theme.titlebar_ontop_button_normal_inactive = path .. "/titlebar/ontop_normal_inactive.png"
-- theme.titlebar_ontop_button_focus_inactive  = path .. "/titlebar/ontop_focus_inactive.png"
-- theme.titlebar_ontop_button_normal_active = path .. "/titlebar/ontop_normal_active.png"
-- theme.titlebar_ontop_button_focus_active  = path .. "/titlebar/ontop_focus_active.png"

-- theme.titlebar_sticky_button_normal_inactive = path .. "/titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive  = path .. "/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active = path .. "/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active  = path .. "/titlebar/sticky_focus_active.png"

-- theme.titlebar_floating_button_normal_inactive = path .. "/titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive  = path .. "/titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active = path .. "/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active  = path .. "/titlebar/floating_focus_active.png"

-- theme.titlebar_maximized_button_normal_inactive = path .. "/titlebar/maximized_normal_inactive.png"
-- theme.titlebar_maximized_button_focus_inactive  = path .. "/titlebar/maximized_focus_inactive.png"
-- theme.titlebar_maximized_button_normal_active = path .. "/titlebar/maximized_normal_active.png"
-- theme.titlebar_maximized_button_focus_active  = path .. "/titlebar/maximized_focus_active.png"

--====================================================================================================
-- You can use your own command to set your wallpaper
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/blackboard.jpg" }
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/bg.png" }
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/bg_v2.png" }
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/windows_BG_v7_HD.jpg" }
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/windows_BG_v10.jpg" }
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/windows_BG_v11.jpg" }
-- theme.wallpaper_cmd = { "awsetbg " .. path .."/windows_BG_setp14.jpg" }
theme.wallpaper_cmd = { "awsetbg " .. path .."/windows_BG_setp16.jpg" }
--theme.wallpaper_cmd = { "awsetbg " .. path .."/windows_BG_setp21.png" }

--====================================================================================================
-- You can use your own layout icons like this:
theme.layout_fairh = path .. "/layouts/fairhw.png"
theme.layout_fairv = path .. "/layouts/fairvw.png"
theme.layout_floating  = path .. "/layouts/floatingw.png"
theme.layout_magnifier = path .. "/layouts/magnifierw.png"
theme.layout_max = path .. "/layouts/maxw.png"
theme.layout_fullscreen = path .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = path .. "/layouts/tilebottomw.png"
theme.layout_tileleft   = path .. "/layouts/tileleftw.png"
theme.layout_tile = path .. "/layouts/tilew.png"
theme.layout_tiletop = path .. "/layouts/tiletopw.png"
theme.layout_spiral  = path .. "/layouts/spiralw.png"
theme.layout_dwindle = path .. "/layouts/dwindlew.png"

--theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
