-- =====================================================================
--  User autostart overrides (was: custom/execs.conf)
--  Original file contains only a comment. Add custom `hl.exec_cmd( ... )`
--  calls inside the `hl.on("hyprland.start", function() ... end)` block
--  to autostart your own apps.
-- =====================================================================

hl.on("hyprland.start", function()
    --Add custom one-shot autostart commands here, e.g.:
    --hl.exec_cmd("hyprpm reload -n")
end)
