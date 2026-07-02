---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "kitty yazi"
local menu        = "wofi --show drun"
local libreWolf   = "$HOME/Desktop/librewolf-152.0.2-1-linux-x86_64-appimage.AppImage --private-window"
local tor         = "$HOME/tor-browser/Browser/start-tor-browser"
local vscodium    = "$HOME/vscodium/codium"
local lock        = "hyprlock"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local altMod  = "ALT"
local shift   = "SHIFT"

----- CORE WINDOW MANAGEMENT -----
-- Launch and close windows
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.window.kill()) -- Force kill if needed

-- File manager and quick app launchers
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(libreWolf))
hl.bind(mainMod .. " + " .. shift .. " + B", hl.dsp.exec_cmd(tor))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(vscodium))
hl.bind(mainMod .. " + " .. shift .. " + D", hl.dsp.exec_cmd("kitty --title vim -e nvim"))

-- Window state toggles
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())          -- Fullscreen
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))   -- Float/tile

-- Layout management
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg \"togglesplit h\"")) -- Toggle horizontal/vertical

----- WINDOW NAVIGATION (VIM KEYS - FASTER!) -----
-- Move focus with vim keys (hjkl) - much faster than arrows!
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Alternative arrow keys still work (kept for comfort transition)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))



----- WINDOW MOVEMENT & RESIZE -----


----- WORKSPACE MANAGEMENT -----
-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + " .. shift .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Quick workspace cycling (faster than clicking)
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. shift .. " + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse wheel workspace switching
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

----- SPECIAL WORKSPACE (SCRATCHPAD) -----
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + " .. shift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Additional scratchpad for different uses
hl.bind(altMod .. " + S", hl.dsp.workspace.toggle_special("quick"))

----- SYSTEM CONTROL -----
-- Power and lock (improved)
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/power.sh"))
hl.bind(mainMod .. " + " .. shift .. " + L", hl.dsp.exec_cmd(lock))  -- Lock screen
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("$HOME/.config/waybar/scripts/launch.sh"))

-- Notification center
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

----- MOUSE BINDS -----
-- Move/resize windows with mainMod + mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----- MULTIMEDIA KEYS -----
-- Volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media controls (requires playerctl)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

----- BONUS: QUICK TERMINAL COMMANDS -----

-- Quick notes/todo
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("kitty --title scratch -e nvim ~/notes/quick.md"))

-------------------------------------------------
-- SCREENSHOT
-------------------------------------------------

hl.bind("Print", hl.dsp.exec_cmd(
    "grim ~/Pictures/screenshot-$(date +%s).png"
))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(
    "grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%s).png"
))

