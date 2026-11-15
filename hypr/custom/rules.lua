-- =====================================================================
--  User window/layer rule overrides (was: custom/rules.conf)
--  These are loaded AFTER hyprland/rules.lua, so they can shadow
--  default rules if they share a match.
-- =====================================================================

-- # Window/layer rules: https://wiki.hypr.land/Configuring/Window-Rules/
-- # Workspace rules:    https://wiki.hypr.land/Configuring/Workspace-Rules/

-- # Uncomment to apply global transparency to all windows:
-- hl.window_rule({
--     match = { class = ".*" },
--     opacity = { override = 0.89, fullscreen = 0.89 },
-- })

-- Disable blur for all xwayland apps
hl.window_rule({
    match   = { xwayland = true },
    no_blur = true,
})