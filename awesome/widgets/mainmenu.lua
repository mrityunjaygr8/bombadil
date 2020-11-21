local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local xrandr = require("configuration.xrandr")
require("configuration.apps")

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", apps.terminal .. " -e man awesome" },
  { "edit config", apps.editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

xrand_items = xrandr.menu()
xrandmenu = {}
for k1, v1 in ipairs(xrand_items) do
    xrandmenu[#xrandmenu + 1] = v1
end

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                            {"screen selection", xrandmenu, beautiful.awesome_icon},
                            { "open terminal", apps.terminal }
}
                       })


