local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

configuration = require('configuration.config')
require('widgets.top-panel')

local TopPanel = function(s)

  -- Wiboxes are much more flexible than wibars simply for the fact that there are no defaults, however if you'd rather have the ease of a wibar you can replace this with the original wibar code
  local panel =
    wibox(
      {
        ontop = true,
        screen = s,
        height = configuration.toppanel_height,
        width = s.geometry.width,
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = false,
        bg = beautiful.transparent,
        fg = beautiful.fg_normal,
        struts = {
          top = configuration.toppanel_height
        }
      }
    )

  panel:struts(
    {
      top = configuration.toppanel_height
    }
  )
  --

  panel:setup {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        -- mylauncher,
        {
          s.mytaglist,
          bottom = 4,
          color = beautiful.topbar_border,
          widget = wibox.container.margin,
        },
        {
          s.mypromptbox,
          {
            left = 10,
            right = 10,
            widget = wibox.container.margin,  
          },
          bottom = 4,
          color = beautiful.topbar_border,
          widget = wibox.container.margin,
        },
        -- wibox.container.margin(5)
        {
          right = 500,
          widget = wibox.container.margin,
        },
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        -- mykeyboardlayout,
        {
          right = 500,
          widget = wibox.container.margin,
        },
        {
          wibox.widget.systray(),
          bottom = 4,
          color = beautiful.topbar_border,
          widget = wibox.container.margin,
        },
        {
          layout = wibox.layout.fixed.horizontal,
          {
            {
              mytextclock,
              bottom = 4,
              color = beautiful.topbar_border,
              widget = wibox.container.margin,
            },
            bg = beautiful.bg_textclock,
            widget = wibox.container.background,
          },
          {
            {
              s.mylayoutbox,
              bottom = 4,
              color = beautiful.topbar_border,
              widget = wibox.container.margin,
            },
            bg = beautiful.bg_layoutbox,
            widget = wibox.container.background,
          },
        },
      },
  }


  return panel
end

return TopPanel

