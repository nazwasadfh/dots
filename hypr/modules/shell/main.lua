-- =====================================================================
--  Shell overrides -- final look & feel
-- ---------------------------------------------------------------------
--  This used to be ~45 separate `hl.config()` calls with many values
--  repeated three times (hyprlang leftovers). Hyprland applies every call
--  immediately, so the duplicates caused redundant re-configuration
--  passes at startup. They are collapsed into ONE call with the exact
--  same final values -- the resulting config is byte-for-byte identical,
--  only the number of apply passes changed.
-- =====================================================================

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 6,
		layout = "dwindle",
		border_size = 1,
	},

	decoration = {
		rounding = 27,
		active_opacity = 1,
		inactive_opacity = 0.8,
		blur = {
			enabled = false,
			size = 1,
			passes = 3,
		},
	},

	input = {
		kb_layout = "pl",
		numlock_by_default = true,
		repeat_delay = 250,
		repeat_rate = 35,
		follow_mouse = 1,
		sensitivity = 0.2,
		force_no_accel = false,
		touchpad = {
			natural_scroll = false,
			disable_while_typing = true,
			clickfinger_behavior = false,
			scroll_factor = 1.3,
			middle_button_emulation = false,
		},
	},

	misc = {
		focus_on_activate = false,
		vrr = 1,
		disable_splash_rendering = false,
		disable_hyprland_logo = true,
		animate_manual_resizes = false,
		enable_swallow = false,
	},

	binds = {
		allow_workspace_cycles = false,
	},

	cursor = {
		inactive_timeout = 1,
	},

	xwayland = {
		force_zero_scaling = true,
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		smart_split = false,
	},
})
