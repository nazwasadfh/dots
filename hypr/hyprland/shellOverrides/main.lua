-- =====================================================================
--  Shell overrides (was: hyprland/shellOverrides/main.conf)
--
--  The original .conf file is empty (nwg-displays placeholder), so we
--  pre-populate this file with sensible defaults matching the rest of
--  the config (the illogical-impulse shell expects these values).
--  These settings will be applied LAST and therefore override anything
--  from hyprland/general.lua and custom/g.lua.
-- =====================================================================

hl.config({ decoration = { blur     = { enabled = false } } })
hl.config({ decoration = { blur     = { size = 1 } } })
hl.config({ decoration = { blur     = { passes = 3 } } })

hl.config({ decoration = { active_opacity   = 1   } })
hl.config({ decoration = { inactive_opacity = 0.8 } })

hl.config({ general = { gaps_in     = 5 } })
hl.config({ general = { gaps_out    = 6 } })
hl.config({ general = { layout      = "dwindle" } })


hl.config({ input = { kb_layout          = "pl" } })
hl.config({ input = { numlock_by_default = true } })
hl.config({ input = { repeat_delay       = 250 } })
hl.config({ input = { repeat_rate        = 35 } })
hl.config({ input = { follow_mouse       = 1 } })

hl.config({ input = { touchpad = { natural_scroll        = false } } })
hl.config({ input = { touchpad = { disable_while_typing  = true  } } })
hl.config({ input = { touchpad = { clickfinger_behavior  = false } } })
hl.config({ decoration = { blur = { size = 1 } } })
hl.config({ decoration = { blur = { passes = 3 } } })
hl.config({ decoration = { active_opacity = 1 } })
hl.config({ general = { layout = "dwindle" } })
hl.config({ input = { kb_layout = "pl" } })
hl.config({ input = { repeat_delay = 250 } })
hl.config({ input = { repeat_rate = 35 } })
hl.config({ input = { follow_mouse = 1 } })
hl.config({ input = { touchpad = { natural_scroll = false } } })
hl.config({ input = { touchpad = { disable_while_typing = true } } })
hl.config({ input = { touchpad = { clickfinger_behavior = false } } })
hl.config({ input = { touchpad = { scroll_factor = 1.3 } } })
hl.config({ misc = { focus_on_activate = false } })
hl.config({ input = { force_no_accel = false } })
hl.config({ input = { sensitivity = 0.2 } })
hl.config({ misc = { vrr = 1 } })
hl.config({ xwayland = { force_zero_scaling = true } })
hl.config({ misc = { disable_splash_rendering = false } })
hl.config({ misc = { disable_hyprland_logo = true } })
hl.config({ binds = { allow_workspace_cycles = false } })
hl.config({ misc = { animate_manual_resizes = false } })
hl.config({ misc = { enable_swallow = false } })
hl.config({ cursor = { inactive_timeout = 1 } })
hl.config({ decoration = { rounding = 27 } })
hl.config({ decoration = { blur = { enabled = false } } })
hl.config({ general = { border_size = 1 } })
hl.config({ general = { gaps_in = 5 } })
hl.config({ general = { gaps_out = 6 } })
hl.config({ animations = { enabled = true } })
hl.config({ dwindle = { smart_split = false } })
hl.config({ input = { touchpad = { middle_button_emulation = false } } })
