local naughty = require("naughty")

-- simple helper
function notifyDebug (text)
    naughty.notify({ preset = naughty.config.presets.normal,
                     title = "~technical notification~",
                     text = text})
end
