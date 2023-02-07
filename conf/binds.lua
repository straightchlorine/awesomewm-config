local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gears = require("gears")
local apps = require("conf.applications")
local helpers = require("helpers")
local bling = require("utilities.bling")
local machi = require("utilities.layout-machi")
local playerctl_daemon = require("signal.playerctl")

-- aliases
mod = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"
enter = "Return"

---- global keybindings ----
--- general binds
awful.keyboard.append_global_keybindings({

    -- basic window manager controls
	awful.key({ mod, ctrl }, "r", awesome.restart, { description = "wm restart", group = "wm" }),

	awful.key({ mod, ctrl, shift }, "q", awesome.quit, { description = "wm quit", group = "wm" }),

	awful.key({ mod }, "F1", hotkeys_popup.show_help, { description = "wm help", group = "wm" }),

    -- applications
	awful.key({ mod }, enter, function()
		awful.spawn(apps.defaults.terminal)
	end, { descrpion = "terminal", group = "application" }),

	awful.key({ mod, shift }, "w", function()
		awful.spawn(apps.defaults.browser)
	end, { description = "web browser", group = "application" }),

	awful.key({ mod }, "r", function()
		awful.spawn(apps.defaults.launcher)
	end, { desciption = "application launcher", group = "application" }),

	awful.key({ mod, shift }, "f", function()
        awful.spawn.with_shell(apps.defaults.file_manager)
	end, { descrption = "file manager", gruop = "application" }),

	awful.key({ mod, shift }, "c", function()
		awful.spawn(apps.defaults.graphical_ide)
	end, { description = "graphical ide", group = "application" }),

  awful.key({ mod, shift }, "p", function()
      awful.spawn(apps.defaults.playlist, { screen = screen.count(), tag = "3" })
  end, { description = "web browser with playlist open", group = "application"}),

	awful.key({ mod, shift }, "n", function()
		awful.spawn.with_shell(apps.defaults.notes)
	end, { description = "notes", group = "applications" }),

	awful.key({ mod, shift }, "d", function()
      awful.spawn('dfhack', {
        tag = screen[1].tags[1]
      })
      awful.spawn('dwarftherapist', {
        tag = screen[1].tags[2]
      })
  end, { description = "dwarf fortress", group = "applications" }),
})

--- client management
awful.keyboard.append_global_keybindings({

    -- focusing by direction
    awful.key({ mod }, "k", function()
		awful.client.focus.bydirection("up")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus up", group = "client" }),

	awful.key({ mod }, "j", function()
		awful.client.focus.bydirection("down")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus down", group = "client" }),

	awful.key({ mod }, "h", function()
		awful.client.focus.bydirection("left")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus left", group = "client" }),

	awful.key({ mod }, "l", function()
		awful.client.focus.bydirection("right")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus right", group = "client" }), 

    awful.key({ mod }, "Up", function()
		awful.client.focus.bydirection("up")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus up", group = "client" }),

	awful.key({ mod }, "Down", function()
		awful.client.focus.bydirection("down")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus down", group = "client" }),

	awful.key({ mod }, "Left", function()
		awful.client.focus.bydirection("left")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus left", group = "client" }),

	awful.key({ mod }, "Right", function()
		awful.client.focus.bydirection("right")
		bling.module.flash_focus.flashfocus(client.focus)
	end, { description = "focus right", group = "client" }),

    -- resizing
	awful.key({ mod, ctrl }, "k", function(c)
		helpers.client.resize(client.focus, "up")
	end, { description = "resize up", group = "client" }),

	awful.key({ mod, ctrl }, "j", function(c)
		helpers.client.resize(client.focus, "down")
	end, { description = "resize down", group = "client" }),

	awful.key({ mod, ctrl }, "h", function(c)
		helpers.client.resize(client.focus, "left")
	end, { description = "resize left", group = "client" }),

	awful.key({ mod, ctrl }, "l", function(c)
		helpers.client.resize(client.focus, "right")
	end, { description = "resize right", group = "client" }),

	awful.key({ mod, ctrl }, "Up", function(c)
		helpers.client.resize(client.focus, "up")
	end, { description = "resize up", group = "client" }),

	awful.key({ mod, ctrl }, "Down", function(c)
		helpers.client.resize(client.focus, "down")
	end, { description = "resize down", group = "client" }),

	awful.key({ mod, ctrl }, "Left", function(c)
		helpers.client.resize(client.focus, "left")
	end, { description = "resize left", group = "client" }),

	awful.key({ mod, ctrl }, "Right", function(c)
		helpers.client.resize(client.focus, "right")
	end, { description = "resize right", group = "client" }),

    -- bling utilities
	awful.key({ alt }, "a", function()
		bling.module.tabbed.pick_with_dmenu()
	end, { description = "add to tab group", group = "tabs" }),

	awful.key({ alt }, "d", function()
		bling.module.tabbed.pop()
	end, { description = "remove from tab group", group = "tabs" }),

	awful.key({ alt }, "s", function()
		bling.module.tabbed.iter()
	end, { description = "iterate through tab group", group = "tabs" }),

})

-- hardware/general software utility
awful.keyboard.append_global_keybindings({

    --- hardware
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn("brightnessctl set 5%+ -q", false)
	end, { description = "brightness up", group = "hardware/brightness" }),

	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn("brightnessctl set 5%- -q", false)
	end, { description = "brightness down", group = "hardware/brightness" }),

	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("amixer sset Master 5%+", false)
	end, { description = "volume up", group = "hardware/volume" }),

	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("amixer sset Master 5%-", false)
	end, { description = "volume down", group = "hardware/volume" }),

	awful.key({}, "XF86AudioMute", function()
		awful.spawn("amixer sset Master toggle", false)
	end, { description = "volume mute", group = "hardware/volume" }),

	awful.key({}, "XF86AudioPlay", function()
		playerctl_daemon:play_pause()
	end, { description = "play/pause music", group = "music/play_pause" }),

	awful.key({}, "XF86AudioPrev", function()
		playerctl_daemon:previous()
	end, { description = "previous music", group = "music/previous" }),

	awful.key({}, "XF86AudioNext", function()
		playerctl_daemon:next()
	end, { description = "next music", group = "music/next" }),

})

-- layouts
awful.keyboard.append_global_keybindings({

    --- layout
	awful.key({ mod }, "s", function()
		awful.layout.set(awful.layout.suit.tile)
	end, { description = "tiling layout", group = "layout" }),

	awful.key({ mod, shift }, "s", function()
		awful.layout.set(awful.layout.suit.floating)
	end, { description = "floating layout", group = "layout" }),

    awful.key({ mod }, "space", function ()
        awful.layout.inc( 1)
    end, { description = "select next", group = "layout" }),

    awful.key({ mod, shift }, "space", function ()
        awful.layout.inc(-1)
    end, { description = "select previous", group = "layout" }),

    -- machi
	awful.key({ mod }, ".", function()
		machi.default_editor.start_interactive()
	end, { description = "edit the current machi layout", group = "layout/machi" }),

	awful.key({ mod }, "/", function()
		machi.switcher.start(client.focus)
	end, { description = "switch between windows in a machi layout", group = "layout/machi" }),

    -- columns in tiling layout
	awful.key({ mod, alt }, "k", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ mod, alt }, "j", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

	awful.key({ mod, alt }, "Up", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ mod, alt }, "Down", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),

})

-- tags
awful.keyboard.append_global_keybindings({

    awful.key({ mod, alt }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),

	awful.key({ mod, alt }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),

	awful.key({
		modifiers = { mod },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]

            -- if selected already focused tag, return to previous tag
			if tag then
				if tag == screen.selected_tag then
                    awful.tag.history.restore()
				else 
					tag:view_only()
				end
			end

            -- logger for eww
            extractAndLogFromTag(tag)
		end,
	}),

	awful.key({
		modifiers = { mod, ctrl },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tags",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end

            -- logger for eww
            extractAndLogFromTag(tag)
		end,
	}),

	awful.key({
		modifiers = { mod, shift },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tags",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end

                -- logger for eww
                extractAndLogFromTag(tag)
			end
		end,
	}),
})

-- multiscreen setup
awful.keyboard.append_global_keybindings({

    awful.key({ mod, alt }, "l", function () 
        awful.screen.focus_relative( 1) 
    end, { description = "focus the next screen", group = "screen" }),

    awful.key({ mod, alt }, "h", function () 
        awful.screen.focus_relative(-1) 
    end, { description = "focus the previous screen", group = "screen" }),

})

-- client keybindings
client.connect_signal("request::default_keybindings", function()

    awful.keyboard.append_global_keybindings({
       
        -- move by directions
		awful.key({ mod, shift }, "k", function(c)
			awful.client.swap.bydirection("up", c, nil)
		end),

		awful.key({ mod, shift }, "j", function(c)
			awful.client.swap.bydirection("down", c, nil)
		end),

		awful.key({ mod, shift }, "h", function(c)
			awful.client.swap.bydirection("left", c, nil)
		end),

		awful.key({ mod, shift }, "l", function(c)
			awful.client.swap.bydirection("right", c, nil)
		end),

		awful.key({ mod, shift }, "Up", function(c)
			awful.client.swap.bydirection("up", c, nil)
		end),

		awful.key({ mod, shift }, "Down", function(c)
			awful.client.swap.bydirection("down", c, nil)
		end),

		awful.key({ mod, shift }, "Left", function(c)
			awful.client.swap.bydirection("left", c, nil)
		end),

		awful.key({ mod, shift }, "Right", function(c)
			awful.client.swap.bydirection("right", c, nil)
		end),

        -- relative move
		awful.key({ mod, shift, ctrl }, "j", function(c)
			c:relative_move(0, dpi(10), 0, 0)
		end),

		awful.key({ mod, shift, ctrl }, "k", function(c)
			c:relative_move(0, dpi(-10), 0, 0)
		end),

		awful.key({ mod, shift, ctrl }, "h", function(c)
			c:relative_move(dpi(-10), 0, 0, 0)
		end),

		awful.key({ mod, shift, ctrl }, "l", function(c)
			c:relative_move(dpi(10), 0, 0, 0)
		end),

		-- toggle floating
		awful.key({ mod, ctrl }, "space", awful.client.floating.toggle),

        -- toggle fullscreen
		awful.key({ mod }, "f", function()
			client.focus.fullscreen = not client.focus.fullscreen
			client.focus:raise()
		end),

		awful.key({ mod }, "m", function(c)
			c.maximized = not c.maximized
		end, { description = "(un)maximize", group = "client" }),

		awful.key({ mod, ctrl }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end, { description = "(un)maximize vertically", group = "client" }),

		awful.key({ mod, shift }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end, { description = "(un)maximize horizontally", group = "client" }),

		awful.key({ mod }, "n", function(c)
			c.minimized = true
		end, { description = "minimize", group = "client" }),

		awful.key({ mod, ctrl }, "n", function()
			local c = awful.client.restore()
			if c then
				c:activate({ raise = true, context = "key.unminimize" })
			end
		end, { description = "unminimize", group = "client" }),

		--- keep on top
		awful.key({ mod }, "p", function(c)
			c.ontop = not c.ontop
		end),

		--- close window
		awful.key({ mod }, "q", function()
			client.focus:kill()
		end),

		--- center window
		awful.key({ mod }, "c", function()
			awful.placement.centered(c, { honor_workarea = true, honor_padding = true })
		end),
    })

end )

client.connect_signal("request::default_mousebindings", function()

	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),

		awful.button({ mod }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),

		awful.button({ mod }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),

	})

end)
