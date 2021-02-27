--- Separating Multiple Monitor functions as a separeted module (taken from awesome wiki)

local gtable  = require("gears.table")
local spawn   = require("awful.spawn")
local naughty = require("naughty")

-- A path to a fancy icon
local icon_path = ""

-- Get active outputs
local function outputs()
   local outputs = {}
   local xrandr = io.popen("xrandr -q --current")

   if xrandr then
      for line in xrandr:lines() do
         local output = line:match("^([%w-]+) connected ")
         if output then
            outputs[#outputs + 1] = output
                                   end
      end
      xrandr:close()
   end


   return outputs
end

-- Build available choices
local function menu()
   local menu = {}
   local out = outputs()

   for _, o in pairs(out) do
      local cmd = "xrandr --output " .. o .. " --primary"
      local label = o

      menu[#menu + 1] = {label, cmd}
   end

   return menu
end

-- Display xrandr notifications from choices
local state = { cid = nil }

local function naughty_destroy_callback(reason)
  if reason == naughty.notificationClosedReason.expired or
     reason == naughty.notificationClosedReason.dismissedByUser then
    local action = state.index and state.menu[state.index - 1][2]
    local f = assert(io.open("/home/mrityunjaygr8/lua.txt", "w"))
    if action then
      f:write(action, "\n")
      spawn(action, false)
      state.index = nil
    end
    f:close()
  end
end

local function xrandr()
   -- Build the list of choices
   if not state.index then
      state.menu = menu()
      state.index = 1
   end

   -- Select one and display the appropriate notification
   local label, action
   local next  = state.menu[state.index]
   state.index = state.index + 1

   if not next then
      label = "Keep the current configuration"
      state.index = nil
   else
      label, action = next[1], next[2]
   end
   print(label, action)
   naughty.notification({ 
	   message = next,
           icon = icon_path,
           title = label,
           app_name = "System Notification"
   })
end

return {
   outputs = outputs,
   arrange = arrange,
   menu = menu,
   xrandr = xrandr
}
