--[[if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass

	hg.config({
		--[[default_theme = "dark",
		default_preset = "clear",
		tint_color = 0x8899aa22,
		skip_opaque_windows = false,
		refraction_spread = 5,
		brightness = 0.9,

		bevel_strength = 1,

		dark = { brightness = 0.82 },
		light = { adaptive_boost = 0.5 },
    
		--layers = { enabled = true },
		windows = {
			background_cache = false,
		},
	})
	
	-- Layer surfaces: each call whitelists the namespace and configures it
	hg.layer("waybar", { preset = "subtle", mask_threshold = 0.05 })
	hg.layer("swaync")
	hg.layer("quickshell:bezel", { preset = "ui", mask_threshold = 0.3 })
	hg.layer("debug-panel", { exclude = true })

	hg.layer("quickshell:bar", { mask_mode = "region" })
	hg.layer("quickshell:notifications", { mask_mode = "contour", mask_threshold = 0.15 })
	hg.layer("dock", { mask_feather = 0.45 })
	hg.layer("eww-bar", { shape = { inset = 6, radius = -1 } }) -- pill, 6 px inside the layer
	hg.layer("quickshell:card", { shape = { inset = { 24, 0, 24, 0 }, radius = 16 } }) -- top, right, bottom, left
	-- Presets
	hg.preset("clear", {
		glass_opacity = 0.9,
		blur_strength = 0.9,
		--contrast = 1,
		adaptive_dim = 0.11,
		dark = { brightness = 1.8 },
		light = { brightness = 1.2 },
	})

	hg.preset("contrasted", {
		inherits = "high_contrast",
		contrast = 1.2,
		adaptive_dim = 1.5,
		dark = { tint_color = 0x02142aa9 },
	}) 
end ]]
--
--[[
hl.window_rule({
	name = "pulse-on-urgent",
	match = { class = ".*" },
	tag = "+shader_urgent:/home/USERNAME/.config/hypr/shaders/pulse.glsl",
})]]
