-- 
-- @author Piotr Krzysztof
-- https://github.com/straightchlorine
--

pcall(require, "luarocks.loader")
local gears = require("gears")
local beautiful = require("beautiful")

-- theme
local theme_path = gears.filesystem.get_configuration_dir() .. "theme/"
beautiful.init(theme_path .. "theme.lua")

-- configuration
require("conf")

-- autostart
require("conf.autostart")

-- grabage collector
collectgarbage("setpause", 101)
collectgarbage("setstepmul", 1111)
gears.timer({
    timeout = 5,
    autostart = true,
    call_now = true,
    callback = function()
        collectgarbage("collect")
    end,
})
