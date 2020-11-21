---------------------------
-- My awesome theme --
-- Made using default --
-- theme and pywal --
---------------------------

local theme_assets          = require("beautiful.theme_assets")
local xresources            = require("beautiful.xresources")
local dpi                   = xresources.apply_dpi
local gears                 = require("gears")   
local gfs                   = require("gears.filesystem")
local themes_path           = gfs.get_configuration_dir() .. "themes/"
local pywal                 = require("themes.my_theme.pywal")
local icon_dir              = themes_path .. "my_theme/icons/"
local titlebar_theme        = "stoplight"
local tip                   = icon_dir .. "titlebar/" .. titlebar_theme .. '/'

local theme = {}
theme.icons         = icon_dir
theme.font          = "IBM Plex Sans Regular 11"
theme.wallpaper     = pywal.wallpaper
theme.bg_normal     = pywal.colors.color0
theme.bg_focus      = pywal.colors.color13
theme.bg_urgent     = pywal.colors.color8
theme.bg_minimize   = pywal.colors.color14
theme.transparent   = "#00000000"
theme.bg_systray    = theme.bg_normal
theme.bg_textclock  = theme.bg_systray
theme.bg_layoutbox  = theme.bg_systray

theme.fg_normal     = pywal.colors.foreground
theme.fg_focus      = pywal.colors.color0
theme.fg_urgent     = pywal.colors.color0
theme.fg_minimize   = pywal.colors.color0

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(0)
theme.border_normal = pywal.colors.color0
theme.border_focus  = pywal.colors.color13
theme.border_marked = pywal.colors.color8

theme.taglist_fg_focus                          = pywal.colors.color0
theme.taglist_fg_occupied                       = pywal.colors.color0
theme.taglist_fg_urgent                         = pywal.colors.color0
theme.taglist_fg_empty                          = theme.fg_normal
theme.taglist_bg_focus                          = pywal.colors.color2
theme.taglist_bg_occupied                       = pywal.colors.color1
theme.taglist_bg_urgent                         = pywal.colors.color3
theme.taglist_bg_empty                          = theme.bg_normal

theme.topbar_border                             = pywal.colors.color7

-- theme.titlebar_size = dpi(144)

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"


-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."my_theme/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width  = dpi(200)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Layout Icons
theme.layout_max			    = gears.color.recolor_image(theme.icons .. 'layouts/max.svg', theme.topbar_border)
theme.layout_tile				= gears.color.recolor_image(theme.icons .. 'layouts/tile.svg', theme.topbar_border)
theme.layout_dwindle 		    = gears.color.recolor_image(theme.icons .. 'layouts/dwindle.svg', theme.topbar_border)
theme.layout_floating 			= gears.color.recolor_image(theme.icons .. 'layouts/floating.svg', theme.topbar_border)


-- Titlebar icons
-- Titlebar
	
theme.titlebar_size = 11
--theme.titlebar_bg_focus = beautiful.gtk.get_theme_variables().bg_color:sub(1,7) .. '66'
--theme.titlebar_bg_normal = beautiful.gtk.get_theme_variables().base_color:sub(1,7) .. '66'
--theme.titlebar_fg_focus = beautiful.gtk.get_theme_variables().fg_color .. '00'
--theme.titlebar_fg_normal = beautiful.gtk.get_theme_variables().fg_color .. '00'
--
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "/usr/share/icons/Qogir"

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
