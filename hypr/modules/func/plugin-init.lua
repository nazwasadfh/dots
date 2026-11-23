hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpm reload -n")
end)
--KeyBinds
--[[
hl.bind("MOD3 + tab", function()
	hl.plugin.hyprexpo.expo("toggle")
end)
hl.bind("SUPER + code:90", function()
	hl.plugin.hyprexpo.expo("toggle")
end)
]]
hl.bind("MOD3 + E", function()
	hl.plugin.hyprflow.toggle()
end)
hl.define_submap("hyprflow", function()
	hl.bind("Left", function()
		hl.plugin.hyprflow.left()
	end, { repeating = true })
	hl.bind("Right", function()
		hl.plugin.hyprflow.right()
	end, { repeating = true })
	hl.bind("A", function()
		hl.plugin.hyprflow.left()
	end, { repeating = true })
	hl.bind("D", function()
		hl.plugin.hyprflow.right()
	end, { repeating = true })
	hl.bind("Return", function()
		hl.plugin.hyprflow.accept()
	end)
	hl.bind("E", function()
		hl.plugin.hyprflow.accept()
	end)
	hl.bind("P", function()
		hl.plugin.hyprflow.cancel()
	end)
	hl.bind("MOD3 + E", function()
		hl.plugin.hyprflow.toggle()
	end)
	for index = 1, 9 do
		hl.bind(tostring(index), function()
			hl.plugin.hyprflow.jump(index)
		end)
	end
	hl.bind("catchall", function() end)
end)

hl.define_submap("hyprexpo", function()
	hl.bind("left", function()
		hl.plugin.hyprexpo.kb_focus("left")
	end)
	hl.bind("right", function()
		hl.plugin.hyprexpo.kb_focus("right")
	end)
	hl.bind("up", function()
		hl.plugin.hyprexpo.kb_focus("up")
	end)
	hl.bind("down", function()
		hl.plugin.hyprexpo.kb_focus("down")
	end)
	hl.bind("return", function()
		hl.plugin.hyprexpo.kb_confirm()
	end)
	hl.bind("space", function()
		hl.plugin.hyprexpo.kb_confirm()
	end)
	hl.bind("escape", function()
		hl.plugin.hyprexpo.expo("cancel")
	end)
	for i = 11, 36 do
		local letter = string.char(string.byte("A") + (i - 11))

		hl.bind(letter, function()
			hl.plugin.hyprexpo.kb_selecti(tostring(i))
		end)
	end
end)
--[[hl.plugin.hyprexpo.gesture({
	fingers = 4,
	direction = "down",
	action = "expo",
	scale = 0.2,
})
]]
--
--Config
hl.config({
	plugin = {
		hyprfocus = {
			enable = false,
			mouse_focus_animation = "shrink",
			keyboard_focus_animation = "slide",
			slide_height = 29,
			shrink_percentage = 0.5,
			fade_opacity = 1,
		},
		hyprflow = {
			workspace_scale = 0.8,
			workspace_spread = 0.14,
			workspace_overlay = 1,
			workspace_count = 32,
			background_color = "rgba(101827dd)",
			background_opacity = 0.7,
			background_blur = 0,
			reflection_opacity = 0.4,
			center_y = 0.2,
			show_labels = 1,
			border_width = 14,
			border_color = "rgba(aaaaaa95)",
			border_color_current = "rgba(b43429ff) rgba(9f1218ff) rgba(5c0705ff) 90deg",
			border_color_focus = "rgba(a060a8ff) rgba(4b0082ff) 45deg",
		},
		--[[		hyprexpo = {
			columns = 6,
			gaps_in = 5,
			gaps_out = 0,
			bg_col = "rgb(111111)",
			workspace_method = "center current",
			gesture_distance = 200,
			cancel_key = "alt",
			show_cursor = 0,
			drag_drop_enable = 0, -- Disable moving windows by dragging workspace previews.
		},
    ]]
		--
	},
})
--[[
if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass

	hg.config({
		default_theme = "dark",
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
			live_resample = true,
			live_resample_fps = 60,
		},
		layers = {
			enabled = true,
			live_resample = true,
			live_resample_fps = 60,
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
end
]]
hl.config({
	plugin = {
		dynamic_cursors = {

			-- enables the plugin
			enabled = true,

			-- sets the cursor behaviour, supports these values:
			-- tilt    - tilt the cursor based on x-velocity
			-- rotate  - rotate the cursor based on movement direction
			-- stretch - stretch the cursor shape based on direction and velocity
			-- none    - do not change the cursor's behaviour
			mode = "rotate",

			-- minimum angle difference in degrees after which the shape is changed
			-- smaller values are smoother, but more expensive for hw cursors
			threshold = 2,

			-- for mode = "rotate"
			rotate = {

				-- length in px of the simulated stick used to rotate the cursor
				-- most realistic if this is your actual cursor size
				length = 20,

				-- clockwise offset applied to the angle in degrees
				-- this will apply to ALL shapes
				offset = 0.0,
			},

			-- for mode = "tilt"
			tilt = {

				-- controls how powerful the tilt is, the lower, the more power
				-- this value controls at which speed (px/s) the full tilt is reached
				limit = 5000,

				-- relationship between speed and tilt, supports these values:
				-- linear             - a linear function is used
				-- quadratic          - a quadratic function is used (most realistic to actual air drag)
				-- negative_quadratic - negative version of the quadratic one, feels more aggressive
				-- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
				activation = "negative_quadratic",

				-- time window (ms) over which the speed is calculated
				-- higher values will make slow motions smoother but more delayed
				window = 100,

				-- full tilt for each side (°)
				full = 60,
			},

			-- for mode = "stretch"
			stretch = {

				-- controls how much the cursor is stretched
				-- this value controls at which speed (px/s) the full stretch is reached
				-- the full stretch being twice the original length
				limit = 3000,

				-- relationship between speed and stretch amount, supports these values:
				-- linear             - a linear function is used
				-- quadratic          - a quadratic function is used
				-- negative_quadratic - negative version of the quadratic one, feels more aggressive
				-- see `activation` in `src/mode/utils.cpp` for how exactly the calculation is done
				activation = "quadratic",

				-- time window (ms) over which the speed is calculated
				-- higher values will make slow motions smoother but more delayed
				window = 150,
			},

			-- configure shake to find
			-- magnifies the cursor if its is being shaken
			shake = {

				-- enables shake to find
				enabled = false,

				-- controls how soon a shake is detected
				-- lower values mean sooner
				threshold = 6.0,

				-- magnification level immediately after shake start
				base = 4.0,
				-- magnification increase per second when continuing to shake
				speed = 4.0,
				-- how much the speed is influenced by the current shake intensity
				influence = 0.0,

				-- maximal magnification the cursor can reach
				-- values below 1 disable the limit (e.g. 0)
				limit = 0.0,

				-- time in milliseconds the cursor will stay magnified after a shake has ended
				timeout = 2000,

				-- show cursor behaviour `tilt`, `rotate`, etc. while shaking
				effects = false,

				-- enable ipc events for shake
				-- see the `ipc` section below
				ipc = false,
			},

			-- use hyprcursor to get a higher resolution texture when the cursor is magnified
			-- see the `hyprcursor` section below
			hyprcursor = {

				-- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
				-- this will also have effect without hyprcursor support being enabled
				-- 0 - never use pixelated scaling
				-- 1 - use pixelated when no highres image
				-- 2 - always use pixelated scaling
				nearest = 1,

				-- enable dedicated hyprcursor support
				enabled = true,

				-- resolution in pixels to load the magnified shapes at
				-- be warned that loading a very high-resolution image will take a long time and might impact memory consumption
				-- -1 means we use [normal cursor size] * [shake:base option]
				resolution = -1,

				-- shape to use when clientside cursors are being magnified
				-- see the shape-name property of shape rules for possible names
				-- specifying clientside will use the actual shape, but will be pixelated
				fallback = "clientside",
			},
		},
	},
})
