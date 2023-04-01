local awful = require('awful')

local hotkeys_popup = require('awful.hotkeys_popup').widget

local bling = require('utilities.bling')
local pctl = require('signal.playerctl')

require('awful.hotkeys_popup.keys')
require('awful.autofocus')

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
    function ()
      awful.tag.incmwfact(0.5)
    end,
    { descritption = 'increase width', group = 'layout' }
  ),
  awful.key(
    { alt, 'Shift' },
    'h',
    function ()
      awful.tag.incmwfact(-0.5)
    end,
    { descritption = 'decrease width', group = 'layout' }
  ),

  awful.key(
    { mod, 'Shift' },
    'l',
    function ()
      awful.tag.incmaster(-1, nil, true)
    end,
    { descritption = 'decrease the number of master clients', group = 'layout' }
  ),
  awful.key(
    { mod, 'Shift' },
    'h',
    function ()
      awful.tag.incmaster(1, nil, true)
    end,
    { descritption = 'increase the number of master clients', group = 'layout' }
  ),

  awful.key(
    { mod, 'Control' },
    'h',
    function ()
      awful.tag.incncol(1, nil, true)
    end,
    { description = 'increase the number of columns', group = 'layout' }
  ),
  awful.key(
    { mod, 'Control' },
    'l',
    function ()
      awful.tag.incncol(-1, nil, true)
    end,
    { description = 'decrease the number of columns', group = 'layout' }
  ),

  awful.key(
    { mod },
    'space',
    function ()
      awful.layout.inc(1)
    end,
    { description = 'select next', group = 'layout' }
  ),
  awful.key(
    { mod, 'Shift' },
    'space',
    function ()
      awful.layout.inc(-1)
    end,
    { description = 'select previous', group = 'layout' }
  ),

})

awful.keyboard.append_global_keybindings({

  awful.key(
    {},
    'XF86MonBrightnessUp',
    function ()
      awful.spawn('light -A 10', false)
      -- add widgets here
    end,
    { description = 'increase brightness by 10%', group = 'hardware/brightness' }
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function ()
      awful.spawn('light -U 10', false)
      -- add widgets here
    end,
    { description = 'decrease brightness by 10%', group = 'hardware/brightness' }
  ),

  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function ()
      awful.spawn('amixer sset Master 5%+', false)
      -- add widgets here
    end,
    { description = 'increase volume by 5%', group = 'hardware/volume' }
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function ()
      awful.spawn('amixer sset Master 5%-', false)
      -- add widgets here
    end,
    { description = 'decrease volume by 5%', group = 'hardware/volume' }
  ),

  awful.key(
    {},
    'XF86AudioMute',
    function ()
      awful.spawn('amixer -D pulse set Master 1+ toggle', false)
      -- add widgets here
    end,
    { description = 'toggle mute', group = 'hardware/volume' }
  ),

  awful.key(
    {},
    'XF86AudioMicMute',
    function ()
      awful.spawn('amixer set Capture toggle', false)
      -- add widgets here
    end,
    { description = 'mute microphone', group = 'hardware/capture' }
  ),

  awful.key(
    {},
    'XF86AudioPlay',
    function ()
      pctl:play_pause()
      -- add widgets here
    end,
    { description = 'play and pause', group = 'music' }
  ),

  awful.key(
    {},
    'XF86AudioPrev',
    function ()
      pctl:previous()
      -- add widgets here
    end,
    { description = 'previous', group = 'music' }
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function ()
      pctl:next()
      -- add widgets here
    end,
    { description = 'next', group = 'music' }
  ),

})

awful.keyboard.append_global_keybindings({

  awful.key(
    { mod },
    'q',
    function(c)
      c:kill()
    end,
    { description = 'close client', group = 'client'}
  ),

  awful.key(
    { mod },
    'k',
    function ()
      awful.client.focus.bydirection('up')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client above', group = 'client' }
  ),
  awful.key(
    { mod },
    'Up',
    function ()
      awful.client.focus.bydirection('up')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client above', group = 'client' }
  ),

  awful.key(
    { mod },
    'j',
    function ()
      awful.client.focus.bydirection('down')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client below', group = 'client' }
  ),
  awful.key(
    { mod },
    'Down',
    function ()
      awful.client.focus.bydirection('down')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client below', group = 'client' }
  ),

  awful.key(
    { mod },
    'h',
    function ()
      awful.client.focus.bydirection('left')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client to the left', group = 'client' }
  ),
  awful.key(
    { mod },
    'Left',
    function ()
      awful.client.focus.bydirection('left')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client to the left', group = 'client' }
  ),

  awful.key(
    { mod },
    'l',
    function ()
      awful.client.focus.bydirection('right')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client to the right', group = 'client' }
  ),
  awful.key(
    { mod },
    'Right',
    function ()
      awful.client.focus.bydirection('right')
      bling.module.flash_focus.flashfocus(client.focus)
    end,
    { description = 'focus on the client to the right', group = 'client' }
  ),

})

client.connect_signal('request::default_keybindings',
  function ()

    awful.keyboard.default_keybindings({
      awful.key(
        { mod, 'Shift' },
        'l',
        function(c)
          awful.client.swap.bydirection('right', c, nil)
        end,
        { description = 'swap with the client to the right', group = 'client' }
      ),
      awful.key(
        { mod, 'Shift' },
        'Right',
        function(c)
          awful.client.swap.bydirection('right', c, nil)
        end,
        { description = 'swap with the client to the right', group = 'client' }
      ),

      awful.key(
        { mod, 'Shift' },
        'h',
        function(c)
          awful.client.swap.bydirection('left', c, nil)
        end,
        { description = 'swap with the client to the left', group = 'client' }
      ),
      awful.key(
        { mod, 'Shift' },
        'Left',
        function(c)
          awful.client.swap.bydirection('left', c, nil)
        end,
        { description = 'swap with the client to the left', group = 'client' }
      ),

      awful.key(
        { mod, 'Shift' },
        'k',
        function(c)
          awful.client.swap.bydirection('up', c, nil)
        end,
        { description = 'swap with the client above', group = 'client' }
      ),
      awful.key(
        { mod, 'Shift' },
        'Up',
        function(c)
          awful.client.swap.bydirection('up', c, nil)
        end,
        { description = 'swap with the client above', group = 'client' }
      ),

      awful.key(
        { mod, 'Shift'},
        'j',
        function(c)
          awful.client.swap.bydirection('down', c, nil)
        end,
        { description = 'swap with the client below', group = 'client' }
      ),
      awful.key(
        { mod, 'Shift'},
        'Down',
        function(c)
          awful.client.focus.bydirection('down', c, nil)
        end,
        { description = 'swap with the client below', group = 'client' }
      ),

      awful.key(
        { mod },
        'f',
        function (c)
          c.fullscreen = not c.fullscreen
          c:raise()
        end,
        { description = 'toggle fullscreen', group = 'client' }
      ),

      awful.key(
        { mod, 'Control' },
        'space',
        awful.client.floating.toggle,
        { description = 'toggle floating', group = 'client' }
      ),

      awful.key(
        { mod, 'Control' },
        'Return',
        function (c)
          c:swap(awful.client.getmaster())
        end,
        { description = 'move to master', group = 'client' }
      ),

      awful.key({ mod },
        'o',
        function (c)
          c:move_to_screen()
        end,
        { description = 'move to screen', group = 'client' }
      ),

      awful.key(
        { mod },
        't',
        function (c)
          c.ontop = not c.ontop
        end,
        { description = 'toggle keep on top', group = 'client' }
      ),

      awful.key(
        { mod },
        'm',
        function (c)
          c.maximized = not c.maximized
          c:raise()
        end ,
        { description = '(un)maximize', group = 'client' }
      ),

      awful.key(
        { mod, 'Control' },
        'm',
        function (c)
          c.maximized_vertical = not c.maximized_vertical
          c:raise()
        end ,
        { description = '(un)maximize vertically', group = 'client' }
      ),
      awful.key(
        { mod, 'Shift'   },
        'm',
        function (c)
          c.maximized_horizontal = not c.maximized_horizontal
          c:raise()
        end ,
        { description = '(un)maximize horizontally', group = 'client' }
      ),

      awful.key(
        { mod },
        'n',
        function (c)
          c.minimized = true
        end ,
        { description = 'minimize', group = 'client' }
      ),

    })
  end
)

awful.keyboard.append_global_keybindings({
  awful.key(
    { mod, 'Control' },
    'n',
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:activate { raise = true, context = 'key.unminimize' }
      end
    end,
    { description = 'restore minimized', group = 'client' }
  ),
})

client.connect_signal('request::default_mousebindings',
  function ()
    awful.mouse.append_client_mousebindings({
      awful.button(
        { },
        1,
        function (c)
          c:activate { context = 'mouse_click' }
        end
      ),

      awful.button(
        { mod },
        1,
        function (c)
          c:activate { context = 'mouse_click', action = 'mouse_move'  }
        end
      ),

      awful.button(
        { mod },
        3,
        function (c)
          c:activate { context = 'mouse_click', action = 'mouse_resize' }
        end
      ),

    })

  end

)

awful.keyboard.append_global_keybindings({

  awful.key(
    { mod },
    'Escape',
    awful.tag.history.restore,
    { description = 'go back', group = 'tag' }
  ),

})

awful.keyboard.append_global_keybindings({

  awful.key(
    { mod, 's' },
    'j',
    function ()
      awful.screen.focus_relative( 1)
    end,
    { description = 'focus the next screen', group = 'screen' }
  ),

  awful.key(
    { mod, 's' },
    'k',
    function ()
      awful.screen.focus_relative(-1)
    end,
    { description = 'focus the previous screen', group = 'screen' }
  ),

})
