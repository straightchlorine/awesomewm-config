local awful = require("awful")

-- tags
screen.connect_signal("request::desktop_decoration", function(s)
    -- tag table for each screen
    awful.tag({ "1", "2", "3", "4"  }, s, awful.layout.layouts[1])
end)
