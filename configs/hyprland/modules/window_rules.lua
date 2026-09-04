-- Window Rules 

hl.window_rule({
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})

hl.window_rule({
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.window_rule({
	name = "sppress-maximise-events",
	match = { class = ".*"},

	suppress_event = "maximize",
})

hl.window_rule({
	name = "all-floating",
	match = { class = ".*" },

	float = 1,
	size = {"monitor_w * 0.5", "monitor_h * 0.5"}
})

hl.window_rule({
	name = "minimum-window-size",
	match = { class = ".*" },

	min_size = { 500, 500}
})
