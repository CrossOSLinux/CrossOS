-- Cross OS - Hyprland Config
-- Version: 0.2
-- Phase 3: noctalia 

-- --- Variables ---
local terminal = "foot"
local menu = "fuzzel"
local mod = "SUPER"

-- --- Monitors ---
hl.set("monitor", ",preferred,auto,auto")
hl.set("monitor", "HEADLESS-1, 1920x1080, 0x0, 1")

-- --- Autostart ---
hl.exec_once("noctalia")
hl.exec_once("/usr/lib/polkit-kde-authentication-agent-1")
hl.exec_once("wayvnc 0.0.0.0")

-- --- Environment ---
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("WLR_BACKENDS", "headless,libinput")

-- --- General ---
hl.set("general:gaps_in", 5)
hl.set("general:gaps_out", 10)
hl.set("general:border_size", 1)
hl.set("general:col.active_border", "rgba(cdd6f4ee)")
hl.set("general:col.inactive_border", "rgba(595959aa)")
hl.set("general:layout", "dwindle")

-- --- Decoration ---
hl.set("decoration:rounding", 20)
hl.set("decoration:active_opacity", 1.0)
hl.set("decoration:inactive_opacity", 0.77)

hl.set("decoration:shadow:enabled", true)
hl.set("decoration:shadow:range", 4)
hl.set("decoration:shadow:render_power", 3)
hl.set("decoration:shadow:color", "0xee1a1a1a")

hl.set("decoration:blur:enabled", true)
hl.set("decoration:blur:size", 3)
hl.set("decoration:blur:passes", 2)
hl.set("decoration:blur:vibrancy", 0.1696)

-- --- Animations ---
hl.set("animations:enabled", true)

-- --- Dwindle ---
hl.set("dwindle:preserve_split", true)

-- --- Misc ---
hl.set("misc:disable_hyprland_logo", true)
hl.set("misc:disable_splash_rendering", true)
hl.set("misc:force_default_wallpaper", 0)

-- --- Input ---
hl.set("input:kb_layout", "us")
hl.set("input:follow_mouse", 1)
hl.set("input:sensitivity", 0)
hl.set("input:touchpad:natural_scroll", false)

-- --- Keybinds ---
-- Applications
hl.bind(mod, "Return", "exec", terminal)
hl.bind(mod, "C", "killactive")
hl.bind(mod, "M", "exit")
hl.bind(mod, "R", "exec", menu)
hl.bind(mod, "V", "togglefloating")
hl.bind(mod, "F", "fullscreen")

-- Focus
hl.bind(mod, "left", "movefocus", "l")
hl.bind(mod, "right", "movefocus", "r")
hl.bind(mod, "up", "movefocus", "u")
hl.bind(mod, "down", "movefocus", "d")

-- Workspaces
for i = 1, 5 do
    hl.bind(mod, tostring(i), "workspace", tostring(i))
    hl.bind(mod .. " SHIFT", tostring(i), "movetoworkspace", tostring(i))
end

-- Mouse Binds
hl.bindm(mod, "mouse:272", "movewindow")
hl.bindm(mod, "mouse:273", "resizewindow")

-- --- Window Rules ---
hl.set("windowrulev2", "suppressevent maximize, class:.*")
