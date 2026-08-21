-- Cross OS - Hyprland Config
-- Version: 0.2
-- Phase 3: noctallia 

-- --- Variables ---
local terminal = "foot"
local menu = "fuzzel"
local mod = "SUPER"

return {
  -- --- Monitors ---
  monitor = {
    ",preferred,auto,auto",
    "HEADLESS-1, 1920x1080, 0x0, 1",
  },

  -- --- Autostart ---
  exec_once = {
    "noctalia",
    "/usr/lib/polkit-kde-authentication-agent-1",
    "wayvnc 0.0.0.0",
  },

  -- --- Environment ---
  env = {
    "XCURSOR_SIZE,24",
    "HYPRCURSOR_SIZE,24",
    "QT_QPA_PLATFORM,wayland",
    "WLR_BACKENDS,headless,libinput",
  },

  -- --- General ---
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 1,
    ["col.active_border"] = "rgba(cdd6f4ee)",
    ["col.inactive_border"] = "rgba(595959aa)",
    layout = "dwindle",
  },

  -- --- Decoration ---
  decoration = {
    rounding = 20,
    active_opacity = 1.0,
    inactive_opacity = 0.77,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "0xee1a1a1a",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },

  -- --- Animations ---
  animations = {
    enabled = true,
  },

  -- --- Dwindle ---
  dwindle = {
    preserve_split = true,
  },

  -- --- Misc ---
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    force_default_wallpaper = 0,
  },

  -- --- Input ---
  input = {
    kb_layout = "us",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
  },

  -- --- Keybinds ---
  bind = {
    -- Applications
    mod .. ", Return, exec, " .. terminal,
    mod .. ", C, killactive",
    mod .. ", M, exit",
    mod .. ", R, exec, " .. menu,
    mod .. ", V, togglefloating",
    mod .. ", F, fullscreen",

    -- Focus
    mod .. ", left, movefocus, l",
    mod .. ", right, movefocus, r",
    mod .. ", up, movefocus, u",
    mod .. ", down, movefocus, d",

    -- Workspaces
    mod .. ", 1, workspace, 1",
    mod .. ", 2, workspace, 2",
    mod .. ", 3, workspace, 3",
    mod .. ", 4, workspace, 4",
    mod .. ", 5, workspace, 5",

    -- Move window to workspace
    mod .. " SHIFT, 1, movetoworkspace, 1",
    mod .. " SHIFT, 2, movetoworkspace, 2",
    mod .. " SHIFT, 3, movetoworkspace, 3",
    mod .. " SHIFT, 4, movetoworkspace, 4",
    mod .. " SHIFT, 5, movetoworkspace, 5",
  },

  -- Mouse Binds
  bindm = {
    mod .. ", mouse:272, movewindow",
    mod .. ", mouse:273, resizewindow",
  },

  -- --- Window Rules ---
  windowrulev2 = {
    "suppressevent maximize, class:.*",
  },
}
