-- =====================================================================
--  User variable overrides (was: custom/variables.conf)
--  Loaded right after modules/core/variables.lua and before anything
--  reads the values, so editing the table here works.
--
--  Example:
--      local vars = require("modules.core.variables")
--      vars.terminal = "kitty"
-- =====================================================================

return require("modules.core.variables")
