local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local mod = 'Mod4' -- windows key
local alt = 'Mod1'

awful.keyboard.append_global_keybindings({

  awful.key(
    { mod },
    'F1',
    hotkeys_popup.show_help,
    { descritption = 'help', group = 'general' }
  ),

  awful.key(
    { mod , 'Control' },
    'r',
    awesome.restart(),
    { descritption = 'restart wm', group = 'general' }
  ),

  awful.key(
    { mod, 'Control' },
    'q',
    awesome.quit(),
    { descritption = 'quit wm', group = 'general' }
  ),

})

awful.keyboard.append_global_keybindings({

  awful.key(
    { alt, 'Shift' },
    'l',
    function()
      awful.tag.incmwfact(0.5)
    end,
    { descritption = 'increase width', group = 'layout' }
  ),

  awful.key(
    { alt, 'Shift' },
    'h',
    function()
      awful.tag.incmwfact(-0.5)
    end,
    { descritption = 'decrease width', group = 'layout' }
  ),

  awful.key(
    { mod, 'Shift' },
    'l',
    function()
      awful.tag.incmaster(-1, nil, true)
    end,
    { descritption = 'decrease the number of master clients', group = 'layout' }
  ),

  awful.key(
    { mod, 'Shift' },
    'h',
    function()
      awful.tag.incmaster(1, nil, true)
    end,
    { descritption = 'increase the number of master clients', group = 'layout' }
  ),

  awful.key(
    { mod, 'Control' },
    'h',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    { description = 'increase the number of columns', group = 'layout' }
  ),

  awful.key(
    { mod, 'Control' },
    'l',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    { description = 'decrease the number of columns', group = 'layout' }
  ),

})

-- hardware/general software utility
awful.keyboard.append_global_keybindings({

  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('light -A 10', false)
      -- add widgets here
    end,
    { description = 'increase brightness by 10%', group = 'hardware/brightness' }
  ),

  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('light -U 10', false)
      -- add widgets here
    end,
    { description = 'increase brightness by 10%', group = 'hardware/brightness' }
  ),

  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer sset Master 5%+', false)
      -- add widgets here
    end,
    { description = 'increase volume by 5%', group = 'hardware/volume' }
  ),

  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer sset Master 5%-', false)
      -- add widgets here
    end,
    { description = 'decrease volume by 5%', group = 'hardware/volume' }
  ),

  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle', false)
      -- add widgets here
    end,
    { description = 'toggle mute', group = 'hardware/volume' }
  ),

  awful.key(
    {},
    'XF86AudioPlay',
    function()
      -- playerctl_daemon:play_pause()
      -- add widgets here
    end,
    { description = 'play and pause', group = 'music' }
  ),

  awful.key(
    {},
    'XF86AudioPrev',
    function()
      -- playerctl_daemon:previous()
      -- add widgets here
    end,
    { description = 'previous', group = 'music' }
  ),

  awful.key(
    {},
    'XF86AudioNext',
    function()
      -- playerctl_daemon:next()
      -- add widgets here
    end,
    { description = 'next', group = 'music' }
  ),

})