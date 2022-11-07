local notifier = require("helpers.notifier")

-- temp fix
function getSupportScreen()
    local awful = require("awful")
    if screen.count() >= 2 then
        return screen.count()
    else 
        return 1
    end
end


