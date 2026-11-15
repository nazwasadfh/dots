-- =====================================================================
--  Hyprland main configuration (Lua port of hyprland.conf)
-- ---------------------------------------------------------------------
--  This file replaces `~/.config/hypr/hyprland.conf` for Hyprland >=0.55,
--  where the legacy hyprlang format was deprecated in favor of Lua.
--  See: https://wiki.hypr.land/Configuring/Start/
--
--  All included files live next to this one in `lua/`. The legacy `.conf`
--  files under `hyprland/` and `custom/` are kept untouched for reference
--  and so that other tools (e.g. `hyprctl reload`) still work.
-- =====================================================================

-- ---------------------------------------------------------------------
--  Helper: load a config file tolerantly.
--  Equivalent to the old `# hyprlang noerror true` / `false` blocks:
--  a missing or broken file prints a warning, it does not abort the
--  whole config (see `Start.md` -> "Error behavior").
-- ---------------------------------------------------------------------
local function safe_require(name)
	local ok, err = pcall(require, name)
	if not ok then
		print("[hyprland.lua] warning: could not load '" .. name .. "': " .. tostring(err))
	end
end

hl.on("hyprland.start", function()
	--hl.exec_cmd("/home/imfl/.local/bin/hylock")
	hl.exec_cmd(
		"qs -c ~/.config/quickshell/end4-pC/ " --&&qs -p ~/.config/quickshell/hello-lock/&qs ipc -p ~/.config/quickshell/hello-lock call lock lock"
	)
	--hl.exec_cmd("~/.config/quickshell/hello-lock/startd")
	--hl.exec_cmd("qs ipc -p ~/.config/quickshell/hello-lock call lock lock")
	--	hl.exec_cmd("~/.config/quickshell/hello-lock/lock")
end)
-- ---------------------------------------------------------------------
--  Environment variables
-- ---------------------------------------------------------------------
-- # hyprlang noerror true
-- source=hyprland/env.conf
safe_require("hyprland.env")
-- # hyprlang noerror false
-- # hyprlang noerror true
-- source=custom/env.conf
safe_require("custom.env")
-- # hyprlang noerror false

-- ---------------------------------------------------------------------
--  Variables ($terminal, $fileManager, ...)
-- ---------------------------------------------------------------------
-- # hyprlang noerror true
-- source=hyprland/variables.conf
safe_require("hyprland.variables")
-- # hyprlang noerror false
-- # hyprlang noerror true
-- source=custom/variables.conf
safe_require("custom.variables")
-- # hyprlang noerror false

-- ---------------------------------------------------------------------
--  Defaults (loaded conditionally, just like the original)
-- ---------------------------------------------------------------------

-- # hyprlang if !dontLoadDefaultExecs
-- source=hyprland/execs.conf
if not dontLoadDefaultExecs then
	safe_require("hyprland.execs")
end
-- # hyprlang endif

-- # hyprlang if !dontLoadDefaultGeneral
-- source=hyprland/general.conf
if not dontLoadDefaultGeneral then
	safe_require("hyprland.general")
end
-- # hyprlang endif

-- # hyprlang if !dontLoadDefaultRules
-- source=hyprland/rules.conf
if not dontLoadDefaultRules then
	safe_require("hyprland.rules")
end
-- # hyprlang endif

-- # hyprlang if !dontLoadDefaultColors
-- source=hyprland/colors.conf
if not dontLoadDefaultColors then
	safe_require("hyprland.colors")
end
-- # hyprlang endif

-- # hyprlang if !dontLoadDefaultKeybinds
-- source=hyprland/keybinds.conf
if not dontLoadDefaultKeybinds then
	safe_require("hyprland.keybinds")
end
-- # hyprlang endif

-- ---------------------------------------------------------------------
--  Custom (user overrides)
-- ---------------------------------------------------------------------

-- # hyprlang noerror true
-- source=custom/execs.conf
safe_require("custom.execs")
-- # hyprlang noerror true
-- source=custom/general.conf
-- (the original includes `custom/general.conf` which does not exist;
--  we keep the same behavior of silently ignoring a missing file)
safe_require("custom.general")
-- # hyprlang noerror true
-- source=custom/rules.conf
safe_require("custom.rules")
-- # hyprlang noerror true
-- source=custom/keybinds.conf
safe_require("custom.keybinds")
-- # hyprlang noerror false

-- ---------------------------------------------------------------------
--  Other top-level config bits
-- ---------------------------------------------------------------------

-- source=workspaces.conf
safe_require("workspaces")
-- source=monitors.conf
safe_require("monitors")

-- ---------------------------------------------------------------------
--  Shell overrides
-- ---------------------------------------------------------------------
require("hyprland.animations")
-- source=hyprland/shellOverrides/main.conf
safe_require("hyprland.shellOverrides.main")

hl.config({
	misc = {
		disable_splash_rendering = true,
		disable_hyprland_logo = true,
	},
})
require("hyprland/shellOverrides/animations")
require("func.plugin-init")

require("func.layout-cycle")
require("func.zoom")
require("func.hlconfig")
require("func.per-layout-binds")
require("func.hy3-layout")

require("func.hypr-wall")
require("func.eleven-workspace")

require("func.facesearch")

require("func.glass")
