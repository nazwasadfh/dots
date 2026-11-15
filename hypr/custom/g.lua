-- =====================================================================
--  User general config overrides (was: custom/g.conf)
--  Loaded AFTER hyprland/general.lua. Original was named g.conf and was
--  never referenced in the main config file (only `custom/general.conf`
--  was, which doesn't exist). We keep `g.lua` so the rename still
--  matches if the user adds a `source=custom/g.conf` in future.
-- =====================================================================

-- # Custom reserved area:
-- hl.config({ general = { addreserved = { 0, 0, 0, 0 } } })


-- ===== Performance overrides (custom) =====
-- Tuned for a hybrid-GPU (Intel iGPU + NVIDIA RTX 3050) laptop + an
-- external HDMI-A-1 4K monitor.

hl.config({
    decoration = {
        -- We leave blur enabled but turn xray off (xray would blur
        -- *everything*, which on 4K ate GPU time).
        blur = {
            enabled                   = true,
            xray                      = false,
            special                   = false,
            new_optimizations         = true,
            size                      = 8,    -- smaller kernel
            passes                    = 1,    -- only 1 pass; 4K needs the budget
            brightness                = 1,
            noise                     = 0.05,
            contrast                  = 0.89,
            vibrancy                  = 0.5,
            vibrancy_darkness         = 0.5,
            popups                    = false,
            popups_ignorealpha        = 0.6,
            input_methods             = true,
            input_methods_ignorealpha = 0.8,
        },

        -- Dimming every inactive window costs too much at 4K + many windows.
        dim_inactive = false,
        dim_strength = 0.05,
        dim_special  = 0.2,
    },

    animations = {
        enabled = true,
        -- Animation overrides for the workspace transitions are applied
        -- *after* hl.config() via separate hl.animation() calls below;
        -- see "Custom animation overrides" further down.
    },

    misc = {
        -- These two are also in hyprland/general.conf, but custom is
        -- loaded after it so the values here win.
        disable_splash_rendering = true,
        disable_hyprland_logo    = true,
    },
})

-- NOTE: `workspace_swipe_create` belongs to `gestures{}`, not `misc{}`.
-- Hyprland would warn if we set it here, so we leave the default gesture
-- (4, horizontal, workspace) alone.

-- ---------------------------------------------------------------------
--  Custom animation overrides
--  Old hyprlang: `animation = leaf, enabled, speed, curve, style` re-emits
--  the same effect, overriding whatever came earlier. In Lua we do the
--  same by calling hl.animation() again for the leaf we want to tweak.
-- ---------------------------------------------------------------------
-- workspace
hl.animation({ leaf = "workspaces",         enabled = true, speed = 4,   curve = "menu_decel",      style = "slide"     }) -- 7 -> 4
-- oszczędzamy też specjalny workspace
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 1.8, curve = "emphasizedDecel", style = "slidevert" }) -- 2.8 -> 1.8