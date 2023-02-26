local awful = require("awful")
local naughty = require("naughty")

local function autostart () 
    -- autostarting apps
    awful.spawn.with_shell(os.getenv("HOME") .. "/.config/awesome/conf/scripts/autorun")

    -- adding the error handling
    naughty.connect_signal("request::display_error", function(message, startup)
        naughty.notification {
            urgency = "critical",
            title = "donkey." .. (startup and "error during startup, donkey" or "error somewhere, donkey"),
            message = message,
        }
    end)
end

autostart()
