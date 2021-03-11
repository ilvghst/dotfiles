local awful = require("awful")

local beautiful = require("beautiful")


local _M = {}

function _M.get(clientkeys , clientbuttons)
local rules = {
      {
        id         = "global",
        rule       = { },
        properties = {
            --border_width = beautiful.border_width,
            --border_color = beautiful.border_normal,
            focus     = awful.client.focus.filter,
            raise     = true,
            keys      = clientkeys,
            buttons   = clientbuttons,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }, 

    -- Floating clients.
    {
        id       = "floating",
        rule_any = {
            instance = { 
                "DTA",  -- Firefox addon DownThemAll
                "copyq",
                "pinentry",
                "discord",
                "xdman",
                "vlc",

        },
            class    = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "Sxiv",
                "Tor Browser",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    } , 

    -- Add titlebars to normal clients and dialogs
    {
        id         = "titlebars",
        rule_any   = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = true      }
    } , 

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
}
    return rules
end


return setmetatable(
    {},
    {__call = function(_, ...) return _M.get(...) end }

)
