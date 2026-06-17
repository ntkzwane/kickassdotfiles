-- Hyprland 0.55+ Lua configuration

------------------
---- MONITORS ----
------------------

-- monitor=,preferred,auto,auto
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2",     mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1",     mode = "preferred", position = "2560x0", scale = 1 })
-- ONLY BAD
-- hl.monitor({ output = "DP-2", disabled = true })
-- hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = "auto" })
-- ONLY GUD
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "0x0", scale = 1 })
-- hl.monitor({ output = "DP-1", disabled = true })


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("kwalletd6")
    hl.exec_cmd("kwalletmanager5")
    hl.exec_cmd("nm-applet --indicator")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(aa00ffe0)", "rgba(55ff00e0)" }, angle = 45 },
            inactive_border = "rgba(4d40004a)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },

    group = {
        col = {
            border_active   = { colors = { "rgba(008282e0)", "rgba(820000e0)" }, angle = 45 },
            border_inactive = "rgba(4d40004a)",
        },
        groupbar = {
            col = {
                active   = { colors = { "rgba(008282e0)", "rgba(820000e0)" }, angle = 45 },
                inactive = "rgba(4d40004a)",
            },
        },
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_rules   = "",
        kb_options = "caps:super",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local lockCmd = "~/.kickassdotfiles/i3/lockie"

-- Terminal
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

-- Kill focused window
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())

-- Window focus (vim keys)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Window focus (arrow keys)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Move focused window (vim keys)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Move focused window (arrow keys)
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

-- Fullscreen toggle
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Layout management
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd('hyprctl keyword general:layout "$(hyprctl getoption general:layout | grep -q dwindle && echo master || echo dwindle)"'))
hl.bind(mainMod .. " + S", hl.dsp.group.toggle())
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))

-- Group navigation (tab switching)
hl.bind(mainMod .. " + Tab",        hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.group.prev())

-- Group window management
hl.bind(mainMod .. " + CTRL + W", hl.dsp.window.move({ into_group = "r" }))
hl.bind(mainMod .. " + ALT + W",  hl.dsp.window.move({ out_of_group = true }))

-- Toggle floating
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))

-- Focus mode toggle
hl.bind(mainMod .. " + Space", hl.dsp.window.cycle_next())

-- Switch to workspace / move window to workspace
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Reload config
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))

-- Restart Hyprland (reload)
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Exit/Logout
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())

-- Resize mode
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    local resize = function(x, y)
        return hl.dsp.window.resize({ x = x, y = y, relative = true })
    end

    hl.bind("H",     resize(-10, 0),  { repeating = true })
    hl.bind("J",     resize(0, 10),   { repeating = true })
    hl.bind("K",     resize(0, -10),  { repeating = true })
    hl.bind("L",     resize(10, 0),   { repeating = true })
    hl.bind("left",  resize(-10, 0),  { repeating = true })
    hl.bind("down",  resize(0, 10),   { repeating = true })
    hl.bind("up",    resize(0, -10),  { repeating = true })
    hl.bind("right", resize(10, 0),   { repeating = true })
    hl.bind("Return", hl.dsp.submap("reset"))
    hl.bind("Escape", hl.dsp.submap("reset"))
end)

-- Audio controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true, repeating = true })

-- Brightness controls
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind(mainMod .. " + F5",      hl.dsp.exec_cmd("brightnessctl"))

-- Media player controls
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play"),     { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"),    { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),     { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Lock screen
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(lockCmd))

-- System mode (power menu)
hl.bind(mainMod .. " + Delete", hl.dsp.submap("system"))

hl.define_submap("system", "reset", function()
    local actionAndReset = function(cmd)
        return function()
            hl.dispatch(hl.dsp.exec_cmd(cmd))
            hl.dispatch(hl.dsp.submap("reset"))
        end
    end

    hl.bind("L", actionAndReset(lockCmd))
    hl.bind("E", hl.dsp.exit())
    hl.bind("S", actionAndReset("systemctl suspend"))
    hl.bind("H", actionAndReset("systemctl hibernate"))
    hl.bind("R", actionAndReset("systemctl reboot"))
    hl.bind("SHIFT + S", actionAndReset("systemctl poweroff"))
    hl.bind("Return", hl.dsp.submap("reset"))
    hl.bind("Escape", hl.dsp.submap("reset"))
end)

-- Move workspace to different monitor
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(mainMod .. " + CTRL + H",     hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + L",     hl.dsp.workspace.move({ monitor = "r" }))

-- Screenshot
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp)"'))

-- Application launcher
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

-- Mouse bindings
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspace scrolling with mouse
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})
