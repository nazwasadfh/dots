-- =====================================================================
--  General configuration (was: hyprland/general.conf)
--  See:
--    https://wiki.hypr.land/Configuring/Variables/
--    https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- =====================================================================

-- # source=moni.conf   (commented out in the original; ignored here)

---------------------
--  Touch gestures  --
---------------------
--
-- Old hyprlang syntax:
--   gesture = 3, swipe,       move,
--   gesture = 3, pinch,       float
--   gesture = 4, horizontal,  workspace
--   gesture = 4, up,    dispatcher, global, quickshell:overviewWorkspacesToggle
--   gesture = 4, down,  dispatcher, global, quickshell:overviewWorkspacesClose
--
-- In Lua this maps to `hl.gesture(...)` calls. Each call is one entry.
hl.gesture({ fingers = 3, direction = "swipe", action = "move" })
hl.gesture({ fingers = 3, direction = "pinch", action = "float" })
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

--ERROR-must comment
--hl.gesture({
--    fingers   = 4,
--    direction = "up",
--    action    = "dispatcher",
--    param     = "global quickshell:overviewWorkspacesToggle",
--})
--hl.gesture({
--    fingers   = 4,
--    direction = "down",
--    action    = "dispatcher",
--    param     = "global quickshell:overviewWorkspacesClose",
--})

-- ---------------------------------------------------------------------
--  Hyprland core config
-- ---------------------------------------------------------------------
hl.config({
	gestures = {
		workspace_swipe_distance = 700,
		workspace_swipe_cancel_ratio = 0.2,
		workspace_swipe_min_speed_to_force = 5,
		workspace_swipe_direction_lock = true,
		workspace_swipe_direction_lock_threshold = 10,
		workspace_swipe_create_new = true,
	},

	general = {
		-- Gaps and border
		gaps_in = 4,
		gaps_out = 5,
		gaps_workspaces = 50,

		border_size = 1,
		col = {
			active_border = "rgba(0DB7D455)",
			inactive_border = "rgba(31313600)",
		},
		resize_on_border = true,

		no_focus_fallback = true,

		allow_tearing = true, -- just allows the `immediate` window rule to work

		snap = {
			enabled = true,
			window_gap = 4,
			monitor_gap = 5,
			respect_gaps = true,
		},
	},

	dwindle = {
		preserve_split = true,
		smart_split = false,
		smart_resizing = false,
		-- precise_mouse_move = true,
	},

	decoration = {
		-- 2 = circle, higher = squircle, 4 = very obvious squircle.
		-- Clear squircles look really off; we use only extra .4 here to
		-- make the rounding feel more continuous.
		rounding_power = 2,
		rounding = 18,

		blur = {
			enabled = false,
			xray = false,
			special = false,
			new_optimizations = true,
			size = 10,
			passes = 3,
			brightness = 1,
			noise = 0.05,
			contrast = 0.89,
			vibrancy = 0.5,
			vibrancy_darkness = 0.5,
			popups = false,
			popups_ignorealpha = 0.6,
			input_methods = true,
			input_methods_ignorealpha = 0.8,
		},

		shadow = {
			enabled = false,
			range = 20,
			offset = { 0, 2 },
			render_power = 4,
			color = "rgba(00000020)",
		},

		-- Dim
		dim_inactive = true,
		dim_strength = 0.05,
		dim_special = 0.2,
	},

	animations = {
		enabled = true,
		-- Curve names are defined further below with hl.curve().
	},

	input = {
		kb_layout = "pl",
		numlock_by_default = true,
		repeat_delay = 250,
		repeat_rate = 35,

		follow_mouse = 1,
		off_window_axis_events = 2,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
			scroll_factor = 0.7,
		},
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		-- vfr = 1,
		vrr = 0,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		enable_swallow = false,
		swallow_regex = "(foot|kitty|allacritty|Alacritty)",
		on_focus_under_fullscreen = 2,
		allow_session_lock_restore = true,
		session_lock_xray = true,
		initial_workspace_tracking = false,
		focus_on_activate = true,
	},

	binds = {
		scroll_event_delay = 0,
		hide_special_on_workspace_change = true,
	},

	cursor = {
		zoom_factor = 1,
		zoom_rigid = false,
		zoom_disable_aa = true,
		hotspot_padding = 1,
	},

	xwayland = {
		force_zero_scaling = true,
	},
})

-- ---------------------------------------------------------------------
--  Bezier curves (animations)
-- ---------------------------------------------------------------------
-- Old hyprlang:  bezier = name, x0, y0, x1, y1
-- New Lua API:   hl.curve(name, { type = "bezier",

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
------------------
---- MONITORS ----
------------------

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
-- NOTE: kept verbatim from the original; the path belongs to another user,
-- so this command currently just fails silently. Safe to delete.
hl.on("hyprland.start", function()
	hl.exec_cmd("swaybg -i /home/tony/walls/dune-wars.png")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
-- All the small `hl.config` blocks below (look, layouts, misc, input) are
-- merged into one call; no code reads them in between, so the final
-- config is identical while Hyprland only applies it once.
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 6,
		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "master",
	},

	cursor = { enable_hyprcursor = false, no_hardware_cursors = true },

	decoration = {
		rounding = 20,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
	dwindle = {
		preserve_split = true, -- You probably want this
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
	master = {
		new_status = "master",
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},

	input = {
		kb_layout = "pl",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		-- infamous xset r rate 200 35;
		repeat_rate = 35,
		repeat_delay = 200,
		follow_mouse = 1,
		sensitivity = 0.2, -- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.window_rule({
	name = "firefox-on-ws3",
	match = { class = "^(firefox)$" },
	workspace = "3 silent",
})

--hl.gesture({
--fingers = 3,
-- direction = "horizontal",
--action = "workspace"
--})

---------------------
---- KEYBINDINGS ----
---------------------

local main_mod = "SUPER" -- Sets "Windows" key as main modifier

--hl.bind(main_mod .. " + Return", hl.dsp.exec_cmd(terminal))
--hl.bind(main_mod .. " + Q", hl.dsp.window.close())
--hl.bind(main_mod .. " + SHIFT + Q",
--hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
--hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(fileManager))
--hl.bind(main_mod .. " + F", function()
--	hl.dsp.window.float({ action = "toggle" })
--end)
--hl.bind(main_mod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())

-- Move focus with main_mod + arrow keys

-- Scroll through existing workspaces with main_mod + scroll
hl.bind(main_mod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with main_mod + LMB/RMB and dragging
--hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
--hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
