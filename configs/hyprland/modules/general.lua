-- Gneral section of Hyprland config

hl.config({
	general = {
		gaps_in  = 5,
		gaps_out = 10,

		border_size = 1,
		resize_on_border = true,
		extend_border_grab_area = 10,
		hover_icon_on_border = true,
		
		col = {
			active_border = "rgba(cdd6f4ee)",
			inactive_border = "rgba(595959aa)",
		},

		snap = {
			enabled = true,
			window_gap = 30,
			monitor_gap = 30,
			border_overlap = false,
		},
	},
})
