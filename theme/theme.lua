local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")
local dpi = xresources.apply_dpi
local themes_path = gfs.get_themes_dir()
local theme = {}

theme.font                  = 'sans 8'

theme.titlebar_bg_normal    = '#000000'
theme.titlebar_fg_normal    = '#ffffff'
theme.titlebar_bg_focus     = '#f8f8f8'
theme.titlebar_fg_focus     = '#000000'

theme.useless_gap           = dpi(4)
theme.border_width          = dpi(1)
theme.border_focus          = '#f5f6f6'
theme.border_normal         = '#0c0d16'

return theme
