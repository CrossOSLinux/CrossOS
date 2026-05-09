-- Cross OS hyprland config.

-- This is the monitor setup, leaving sstuff on auto should work.
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- Setting the defualt programs
local terminal = "foot"
local menu = "fuzzel"

-- Environment
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")

-- The great config that is so big i dont knwo what it does
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 1,
		col = {
			active_border = "rgba(cdd6f4ee)",
			inactive_border = "rgba(595959aa)",
		},
		layout = "dwindle",
	},

	decoration = {
		rounding = 8,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.77,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = 0,
	},

	input = {
		kb_layout = "us",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
})

-- Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)

-- Keybinds that i will forget.

local mod = "SUPER"

hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))

-- hyprland tiling focus

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.window_rule({
	name = "suppress-maximize",
	match = { class = ".*" },
	suppress_event = "maximize",
})
