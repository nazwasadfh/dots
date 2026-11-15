-- =====================================================================
--  Autostart (was: hyprland/execs.conf)
--  See: https://wiki.hypr.land/Configuring/Basics/Autostart/
--
--  Hyprland 0.55+ Lua API: spawn a one-shot process on the
--  `hyprland.start` event with `hl.exec_cmd()`. Each call spawns an
--  asynchronous process, so we do NOT need a trailing `& disown`.
-- =====================================================================

local vars = require("hyprland.variables")
local qsConfig = vars.qsConfig

hl.on("hyprland.start", function()
	-- Bar, wallpaper

	hl.exec_cmd("~/.config/hypr/hyprland/scripts/start_geoclue_agent.sh")
	--hl.exec_cmd("qs -c " .. qsConfig)
	hl.exec_cmd("~/.config/hypr/custom/scripts/__restore_video_wallpaper.sh")
	--	hl.exec_cmd("sleep 1&&hylock")
	-- Core components (authentication, lock screen, notification daemon)
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	--hl.exec_cmd("hypridle")

	--hl.exec_cmd("dbus-update-activation-environment --all")

	-- hl.exec_cmd(
	--	"sleep 1 && " .. "dbus-update-activation-environment --systemd " .. "WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
	--	) -- Some fix idk

	-- Audio
	hl.exec_cmd("easyeffects --service-mode")

	-- Clipboard: history
	-- hl.exec_cmd("wl-paste --watch cliphist store") -- alternative
	hl.exec_cmd(
		"wl-paste --type text --watch bash -c '"
			.. "cliphist store && qs -c "
			.. qsConfig
			.. " ipc call cliphistService update')"
	)
	hl.exec_cmd(
		"wl-paste --type image --watch bash -c '"
			.. "cliphist store && qs -c "
			.. qsConfig
			.. " ipc call cliphistService update')"
	)

	-- Cursor
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")

	-- Fix dock pinned apps not launching properly
	-- (https://github.com/end-4/dots-hyprland/issues/2200)
	-- This causes https://github.com/end-4/dots-hyprland/issues/2427
	-- hl.exec_cmd("sleep 3.5 && hyprctl reload && sleep 0.5 && "
	--     .. "touch ~/.config/quickshell/ii/shell.qml")
end)
