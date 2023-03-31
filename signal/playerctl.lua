local bling = require('utilities.bling')

local instance = nil

local function newInstance()
  return bling.signal.playerctl.lib({
    update_on_activity = true,
    player = { "firefox" },
    debounce_delay = 1,
  })
end

if not instance then
  instance = newInstance()
end

return instance
