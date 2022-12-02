local awful = require("awful")
local gears = require("gears")
local ruled = require("ruled")
local helpers = require("helpers")

local s_width = awful.screen.focused().geometry.width
local s_height = awful.screen.focused().geometry.height

ruled.client.connect_signal("request::rules", function()

    -- global
    ruled.client.append_rule({
        id = "global",
        rule = { },
        properties = {
            raise = true,
            size_hints_honor = false,
            honor_workarea = true,
            honor_padding = true,
            screen = awful.screen.focused,
            focus = awful.client.focus.filter,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })

    -- floating
    ruled.client.append_rule({
        id = "floating",
        rule_any = {
        	instance = {
        		"Devtools", --- Firefox devtools
        	},
        	class = {
        		"Lxappearance",
        		"Nm-connection-editor",
            "Pavucontrol",
        	},
        	name = {
        		"Event Tester", -- xev
        	},
        	role = {
        		"AlarmWindow",
        		"pop-up",
        		"GtkFileChooserDialog",
        		"conversation",
        	},
        	type = {
        		"dialog",
        	},
        },
        properties = { floating = true, placement = helpers.client.centered_client_placement },
    })


    -- dialogs
    ruled.client.append_rule({
        id = "centered",
        rule_any = {
            type = {
                "dialog",
            },
            class = {

            },
            role = {
                "GtkFileChooserDialog",
                "conversation",
            },
        },
        properties = {
            placement = helpers.client.centered_client_placement,
        }
    })

    -- image viewers
    ruled.client.append_rule({
        rule_any = {
            class = {
                "pqiv",
                "imv",
                "feh",
            },
        },
        properties = {
            floating = true,
            width = s_width * 0.7,
            height = s_height * 0.75,
        },
        callback = function(c)
            awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
        end
    })

    -- eww widgets
    ruled.client.append_rule({
        rule_any = {
            class = {
                "eww-main-wspaces",
                "eww-auxiliary-wspaces",
                "eww-clock-date-weather",
                "eww-weather",
                "eww-clock-date",
                "eww-calendar",
                "eww-sysinfo",
            },
        },
        properties = {
            valid = false,
            focusable = false,
            border_width = 0,
        },
    })

    -- libreoffice
    ruled.client.append_rule({
        rule = { class = "libreoffice" },
        properties = {
            floating = false,
        },
    })

    -- teams
    ruled.client.append_rule({
        rule = { instance = "microsoft teams - preview" },
        properties = {
            floating = true,
            screen = screen.count(),
            tag = "4",
        },
    })

    -- steam client
    ruled.client.append_rule({
        rule = { name = "Steam" },
        properties = {
            screen = screen.count(),
            tag = "4",
        },
    })

    -- steam friend list
     ruled.client.append_rule({
         rule = { name = "Friends List" },
         properties = { 
             width = 250,
             height = 450,
             screen = screen.count(),
             tag = "4",
             floating = true,
             ontop = true,
         },
     })

    -- steam news
     ruled.client.append_rule({
         rule = { name = "Steam - News" },
         properties = { 
             width = 620,
             height = 440,
             floating = true, 
         },
     })

    -- discord client
    ruled.client.append_rule({
        rule = { class = "discord" },
        properties = {  
            screen = screen.count(),
            tag = "3",
        },
    })

    ruled.client.append_rule({
        rule = { name = "Paradox Launcher" },
        properties = { 
            x = 8,
            y = 62,
            width = 1280,
            height = 670,
            screen = 1,
            tag = "1",
            floating = true, 
        } ,
    })

    ruled.client.append_rule({
        rule = { class = "eu4" },
        properties = { 
            x = 0,
            y = 0,
            border_width = 0,
            screen = 1,
            tag = "1",
            floating = true, 
        },
    })

    ruled.client.append_rule({
        rule = { class = "Civ6Sub" }, 
        properties = {  
            x = 1955,
            y = 53,
            border_width = 0,
            screen = 1,
            tag = "1",
            floating = true, 
        },
    })

    ruled.client.append_rule({
        rule = { class = "factorio" },
        properties = { 
            screen = 1,
            tag = "1",
        },
    })

end)
