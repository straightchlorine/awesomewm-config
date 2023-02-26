local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local bling = require("utilities.bling")
local helpers = require("helpers")

-- sloppy focus
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

--logger section
client.connect_signal("focus", function(c)
    extractAndLogFromClient(c)
end)

client.connect_signal("manage", function(c)
    extractAndLogFromClient(c)
end)

client.connect_signal("unmanage", function(c)
    extractAndLogFromClient(c)
end)

-- borders
client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus 
end)

client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal 
end)

--bling flash focus
bling.module.flash_focus.enable()
