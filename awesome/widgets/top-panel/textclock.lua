local wibox = require("wibox")

-- Create a textclock widget
-- mytextclock = wibox.widget.textclock(" %X @ %d-%m-%Y ")
mytextclock = wibox.widget.textclock(" <span>%X</span> <span size='smaller'>@</span> <span>%d-%m-%Y</span> ")
