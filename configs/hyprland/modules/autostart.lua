-- Autostart file 

hl.on("hyprland.start", function ()
	hl.exec_cmd("noctalia") 
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)
