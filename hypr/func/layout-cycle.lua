hl.bind("ALT+MOD3 + right", function()
	local layouts = { "scrolling", "dwindle", "master", "monocle", "hy3" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
		hl.notification.create({
			text = "Layout: " .. next_layout,
			timeout = 10000,
		})
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
		hl.notification.create({
			text = "Layout: " .. next_layout,
			timeout = 10000,
		})
	end
end)
hl.bind("ALT+MOD3 + left", function()
	local layouts = { "hy3", "monocle", "master", "dwindle", "scrolling" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
		hl.notification.create({
			text = "Layout: " .. next_layout,
			timeout = 10000,
		})
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
		hl.notification.create({
			text = "Layout: " .. next_layout,
			timeout = 10000,
		})
	end
end)
