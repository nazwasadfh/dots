-- =====================================================================
--  Module loader
-- ---------------------------------------------------------------------
--  The old hyprlang config loaded every include inside
--  `# hyprlang noerror true` blocks: a missing or broken file printed a
--  warning instead of aborting the whole configuration. `safe_require`
--  keeps exactly that behaviour for the Lua modules.
-- =====================================================================

local M = {}

--- Load a Lua module, logging (but not raising) on failure.
--- @param name string module name, e.g. "modules.core.general"
--- @return boolean ok
function M.safe_require(name)
	local ok, err = pcall(require, name)
	if not ok then
		print("[hyprland.lua] warning: could not load '" .. name .. "': " .. tostring(err))
	end
	return ok
end

return M
