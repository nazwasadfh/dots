-- =====================================================================
--  Layout cycling
-- ---------------------------------------------------------------------
--  ALT+MOD3+Left / Right cycle through the layouts of the active
--  workspace (special workspaces included). Both directions share the
--  same logic, only the order differs.
-- =====================================================================

local ORDERS = {
	next = { "scrolling", "dwindle", "master", "monocle", "hy3" },
	prev = { "hy3", "monocle", "master", "dwindle", "scrolling" },
}
local FALLBACK = "dwindle"

--- @param order string[] layouts in cycling order
--- @return function callback for hl.bind
local function cycle_layout(order)
	return function()
		local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
		if not workspace then
			return
		end

		local next_layout = FALLBACK
		for i = 1, #order do
			if order[i] == workspace.tiled_layout then
				next_layout = order[(i % #order) + 1]
				break
			end
		end

		local target = workspace.special and tostring(workspace.name) or tostring(workspace.id)
		hl.workspace_rule({ workspace = target, layout = next_layout })
		hl.notification.create({ text = "Layout: " .. next_layout, timeout = 10000 })
	end
end

hl.bind("ALT+MOD3 + right", cycle_layout(ORDERS.next))
hl.bind("ALT+MOD3 + left", cycle_layout(ORDERS.prev))
