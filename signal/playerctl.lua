local bling = require("utilities.bling")

local playerctl = { } 
local instance = nil

local function new()
    return bling.signal.playerctl.lib({
        update_on_activity = true,
        player = { "firefox" },
        debounce_delay = 1,
    })
end

if not instance then
    instance = new()

end

return instance
