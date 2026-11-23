-- =====================================================================
--  Hyprland main configuration -- entry point (Hyprland >= 0.55, Lua)
-- ---------------------------------------------------------------------
--  Layout:
--    modules/core/    defaults shipped with the config
--    modules/custom/  user overrides (loaded after core)
--    modules/shell/   shell (quickshell) integration + final look
--    modules/func/    small runtime helpers (keybind callbacks, plugins)
--
--  Load order is significant: every later module overrides the earlier
--  ones, exactly like the old `source=` chain did.
-- =====================================================================

local safe_require = require("modules.loader").safe_require

-- ---------------------------------------------------------------------
--  Session shell
-- ---------------------------------------------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("qs -c ~/.config/quickshell/end4-pC/ ")
end)

-- ---------------------------------------------------------------------
--  Environment variables
-- ---------------------------------------------------------------------
safe_require("modules.core.env")
safe_require("modules.custom.env")

-- ---------------------------------------------------------------------
--  Variables ($terminal, $fileManager, ...)
-- ---------------------------------------------------------------------
safe_require("modules.core.variables")
safe_require("modules.custom.variables")

-- ---------------------------------------------------------------------
--  Defaults
--  NOTE: these flags are globals on purpose. In hyprlang a `$var` set to
--  "" was falsy; in Lua "" is truthy, so assigning them as "" would
--  disable the defaults. Leave them undefined to load everything.
-- ---------------------------------------------------------------------
if not dontLoadDefaultExecs then
	safe_require("modules.core.execs")
end
if not dontLoadDefaultGeneral then
	safe_require("modules.core.general")
end
if not dontLoadDefaultRules then
	safe_require("modules.core.rules")
end
if not dontLoadDefaultColors then
	safe_require("modules.core.colors")
end
if not dontLoadDefaultKeybinds then
	safe_require("modules.core.keybinds")
end

-- ---------------------------------------------------------------------
--  Custom (user overrides)
-- ---------------------------------------------------------------------
safe_require("modules.custom.execs")
safe_require("modules.custom.general")
safe_require("modules.custom.rules")
safe_require("modules.custom.keybinds")

-- ---------------------------------------------------------------------
--  Monitors & workspaces
-- ---------------------------------------------------------------------
safe_require("modules.workspaces")
safe_require("modules.monitors")

-- ---------------------------------------------------------------------
--  Animations, then the shell overrides (they win, as before)
-- ---------------------------------------------------------------------
safe_require("modules.core.animations")
safe_require("modules.shell.main")

-- Final say on the splash logo (kept after shell/main, like the original).
hl.config({
	misc = {
		disable_splash_rendering = true,
		disable_hyprland_logo = true,
	},
})

safe_require("modules.shell.animations")

-- ---------------------------------------------------------------------
--  Runtime helpers / plugins
-- ---------------------------------------------------------------------
safe_require("modules.func.plugin-init")
safe_require("modules.func.layout-cycle")
safe_require("modules.func.zoom")
safe_require("modules.func.hlconfig")
safe_require("modules.func.per-layout-binds")
safe_require("modules.func.hypr-wall")
safe_require("modules.func.eleven-workspace")
safe_require("modules.func.facesearch")

-- Disabled (100% commented out) plugin experiments, kept for reference:
--   modules/func/glass.lua       -- hyprglass presets
--   modules/func/hy3-layout.lua  -- hy3 layout binds
