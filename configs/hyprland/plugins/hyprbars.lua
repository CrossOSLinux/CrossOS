-- Hyprbars plugin configuration

hl.on("hyprland.start", function ()
  	hl.exec_cmd("hyprpm enable hyprbars")
end)

hl.config({
    plugin = {
        hyprbars = {
            bar_height = 20,
            on_double_click = "hl.dsp.window.fullscreen({action = 'set'})",
        },
    },
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgb(ff4040)",
    fg_color = "rgb(ffffff)",
    size = 10,
    icon = "X",
    action = "hyprctl dispatch 'hl.dsp.window.close()'",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgb(eeee11)",
    fg_color = "rgb(000000)",
    size = 10,
    icon = "_",
    action = [[hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })']],
})
