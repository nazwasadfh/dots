-- =====================================================================
--  Window & Layer rules (was: hyprland/rules.conf)
--  See:
--    https://wiki.hypr.land/Configuring/Basics/Window-Rules/
--    https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
--
--  Conversion notes (hyprlang -> Lua):
--    `windowrule = EFFECTS, match:prop1 val1, match:prop2 val2, ...`
--      becomes
--    `hl.window_rule({ match = {prop1 = val1, prop2 = val2, ...}, ...effects })`
--    `layerrule = ...` becomes `hl.layer_rule({ match = {...}, ... })`.
--    `match:title ^(...)$` -> `match = { title = "^(...)$" }` (RE2 regex).
--    Static effects (e.g. `float on`, `center on`, `no_blur on`, `immediate on`)
--    take `true` / `false` instead of `on` / `off` in Lua.
--    `move X Y` and `size W H` accept a string with a formula, identical
--    syntax to hyprlang.
-- =====================================================================

-- ######## Window rules ########

-- Disable blur for xwayland context menus
hl.window_rule({ match = { class = "^()$", title = "^()$" }, no_blur = true })
-- The original uses `no_blur on` here; the effect field `no_blur` accepts a
-- bool in Lua. The follow-up `no_blur on` for everything is folded into the
-- second rule below.

-- Disable blur for every window
hl.window_rule({ match = { class = ".*" }, no_blur = true })

-- Floating - common dialogs
local floatDialogTitles = {
	"^(Open File)(.*)$",
	"^(Select a File)(.*)$",
	"^(Choose wallpaper)(.*)$",
	"^(Open Folder)(.*)$",
	"^(Save As)(.*)$",
	"^(Library)(.*)$",
	"^(File Upload)(.*)$",
	"^(.*)(wants to save)$",
	"^(.*)(wants to open)$",
}
for _, title in ipairs(floatDialogTitles) do
	hl.window_rule({ match = { title = title }, center = true, float = true })
end
-- Choose wallpaper additionally resized
hl.window_rule({
	match = { title = "^(Choose wallpaper)(.*)$" },
	size = { "monitor_w*.60", "monitor_h*.65" },
})

-- Specific class-based floating rules
local floatClasses = {
	"^(blueberry\\.py)$",
	"^(guifetch)$", -- FlafyDev/guifetch
	"^(pavucontrol)$",
	"^(org\\.pulseaudio\\.pavucontrol)$",
	"^(nm-connection-editor)$",
	".*plasmawindowed.*",
	"^kcm_.*$",
	".*bluedevilwizard",
}
for _, class in ipairs(floatClasses) do
	hl.window_rule({ match = { class = class }, float = true })
end

-- pavucontrol (and its alt name) also sized and centered
for _, class in ipairs({ "^(pavucontrol)$", "^(org\\.pulseaudio\\.pavucontrol)$", "^(nm-connection-editor)$" }) do
	hl.window_rule({
		match = { class = class },
		size = { "monitor_w*.45", "monitor_h*.45" },
		center = true,
	})
end

-- Title-based floating rules
local floatTitleRules = {
	".*Welcome",
	"^(illogical%-impulse Settings)$",
	".*Shell conflicts.*",
}
for _, title in ipairs(floatTitleRules) do
	hl.window_rule({ match = { title = title }, float = true })
end

-- KDE portal dialog
hl.window_rule({
	match = { class = "org.freedesktop.impl.portal.desktop.kde" },
	float = true,
	size = { "monitor_w*.60", "monitor_h*.65" },
})

-- Zotero
hl.window_rule({
	match = { class = "^(Zotero)$" },
	float = true,
	size = { "monitor_w*.45", "monitor_h*.45" },
})

-- Move
-- kde-material-you-colors spawns a window when changing dark/light theme.
-- This is to make sure it doesn't interfere at all.
hl.window_rule({ match = { class = "^(plasma-changeicons)$" }, float = true })
hl.window_rule({ match = { class = "^(plasma-changeicons)$" }, no_initial_focus = true })
hl.window_rule({ match = { class = "^(plasma-changeicons)$" }, move = "999999 999999" })

-- stupid dolphin copy
hl.window_rule({ match = { title = "^(Copying — Dolphin)$" }, move = "40 80" })

-- Tiling
hl.window_rule({ match = { class = "^dev\\.warp\\.Warp$" }, tile = true })

-- Picture-in-Picture
local pipTitle = "^([Pp]icture[-%s]?[Ii]n[-%s]?[Pp]icture)(.*)$"
hl.window_rule({ match = { title = pipTitle }, float = true })
hl.window_rule({ match = { title = pipTitle }, keep_aspect_ratio = true })
hl.window_rule({ match = { title = pipTitle }, move = "monitor_w*.73 monitor_h*.72" })
hl.window_rule({ match = { title = pipTitle }, size = "monitor_w*.25 monitor_h*.25" })
-- The original had a separate `animation slide` line for PiP, but the
-- class is `^(Picture.in.Picture)(.*)$` (note: no `.*` wrap around the
-- literal). Kept verbatim:
hl.window_rule({ match = { title = "^(Picture.in.Picture)(.*)$" }, animation = "slide" })

-- Screen sharing
local sharingTitle = ".*is sharing (a window|your screen).*"
hl.window_rule({ match = { title = sharingTitle }, float = true })
hl.window_rule({ match = { title = sharingTitle }, pin = true })
hl.window_rule({
	match = { title = sharingTitle },
	move = "monitor_w*.5-window_w*.5 monitor_h-window_h-12",
})

-- Tearing
hl.window_rule({ match = { title = ".*\\.exe" }, immediate = true })
hl.window_rule({ match = { title = ".*minecraft.*" }, immediate = true })
hl.window_rule({ match = { class = "^(steam_app).*" }, immediate = true })

-- Fix JetBrains IDEs focus/rerendering problem
hl.window_rule({
	match = {
		class = "^jetbrains-.*$",
		float = true,
		title = "^$|^\\s$|^win\\d+$",
	},
	no_initial_focus = true,
})

-- No shadow for tiled windows (matches windows that are not floating).
hl.window_rule({ match = { float = false }, no_shadow = true })

-- ######## Workspace rules ########
-- Old hyprlang: `workspace = special:special, gapsout:30`
-- New Lua:      hl.workspace_rule({ workspace = "special:special",
--
hl.workspace_rule({ workspace = "", gaps_out = 30 })
hl.workspace_rule({ workspace = "special:special", gaps_out = 50, gaps_in = 20 })
hl.workspace_rule({ workspace = "special:SOCIAL", gaps_out = 50, gaps_in = 20 })
hl.workspace_rule({ workspace = "special:MANIFEST", gaps_out = 50, gaps_in = 20 })

--hl.workspace_rule({ workspace = "", gaps_out = 20 })

-- ######## Layer rules ########
-- Old hyprlang: `layerrule = match:namespace PATTERN, EFFECT on`
-- New Lua:      hl.layer_rule({ match = { namespace = PATTERN }, effect = true })

hl.layer_rule({ match = { namespace = ".*" }, xray = true })
-- hl.layer_rule({ match = { namespace = ".*" },        no_anim = true })
hl.layer_rule({ match = { namespace = "walker" }, no_anim = true })
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })
hl.layer_rule({ match = { namespace = "overview" }, no_anim = true })
hl.layer_rule({ match = { namespace = "anyrun" }, no_anim = true })
hl.layer_rule({ match = { namespace = "indicator.*" }, no_anim = true })
hl.layer_rule({ match = { namespace = "osk" }, no_anim = true })
hl.layer_rule({ match = { namespace = "hyprpicker" }, no_anim = true })

hl.layer_rule({ match = { namespace = "noanim" }, no_anim = true })
hl.layer_rule({ match = { namespace = "gtk-layer-shell" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "launcher" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0.69 })
-- layerrule = match:namespace logout_dialog # wlogout, blur on
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

-- ags
hl.layer_rule({ match = { namespace = "sideleft.*" }, animation = "slide left" })
hl.layer_rule({ match = { namespace = "sideright.*" }, animation = "slide right" })

-- Generic `bar[0-9]*` / `dock[0-9]*` / `overview[0-9]*` / etc.
-- All get `blur on` and `ignore_alpha 0.6` in the original; we loop to
-- keep the file compact.
local blurWithAlpha = {
	{ ns = "session[0-9]*", alpha = nil }, -- the original omits ignore_alpha
	{ ns = "bar[0-9]*", alpha = 0.6 },
	{ ns = "barcorner.*", alpha = 0.6 },
	{ ns = "dock[0-9]*", alpha = 0.6 },
	{ ns = "indicator.*", alpha = 0.6 },
	{ ns = "overview[0-9]*", alpha = 0.6 },
	{ ns = "cheatsheet[0-9]*", alpha = 0.6 },
	{ ns = "sideright[0-9]*", alpha = 0.6 },
	{ ns = "sideleft[0-9]*", alpha = 0.6 },
	{ ns = "osk[0-9]*", alpha = 0.6 },
}
for _, e in ipairs(blurWithAlpha) do
	if e.alpha == nil then
		hl.layer_rule({ match = { namespace = e.ns }, blur = true })
	else
		hl.layer_rule({
			match = { namespace = e.ns },
			blur = true,
			ignore_alpha = e.alpha,
		})
	end
end

-- Quickshell: illogical-impulse
local qs = "quickshell:.*"
hl.layer_rule({ match = { namespace = qs }, blur_popups = true })
hl.layer_rule({ match = { namespace = qs }, blur = true })
hl.layer_rule({ match = { namespace = qs }, ignore_alpha = 0.79 })

-- Per-namespace animation tweaks
local qsAnims = {
	{ ns = "quickshell:bar", anim = "slide" },
	{ ns = "quickshell:cheatsheet", anim = "slide bottom" },
	{ ns = "quickshell:dock", anim = "slide bottom" },
	{ ns = "quickshell:screenCorners", anim = "popin 120%" },
	{ ns = "quickshell:notificationPopup", anim = "fade" },
	{ ns = "quickshell:osk", anim = "slide bottom" },
	{ ns = "quickshell:reloadPopup", anim = "slide" },
	{ ns = "quickshell:sidebarRight", anim = "slide right" },
	{ ns = "quickshell:sidebarLeft", anim = "slide left" },
	{ ns = "quickshell:verticalBar", anim = "slide" },
}
for _, e in ipairs(qsAnims) do
	hl.layer_rule({ match = { namespace = e.ns }, animation = e.anim })
end

-- no_anim-only namespaces
local qsNoAnim = {
	"quickshell:actionCenter",
	"quickshell:lockWindowPusher",
	"quickshell:overlay",
	"quickshell:overview",
	"quickshell:polkit",
	"quickshell:regionSelector",
	"quickshell:screenshot",
	"quickshell:session",
}
for _, ns in ipairs(qsNoAnim) do
	hl.layer_rule({ match = { namespace = ns }, no_anim = true })
end

-- ignore_alpha on overlay/popup/mediaControls
hl.layer_rule({ match = { namespace = "quickshell:overlay" }, ignore_alpha = 1 })
hl.layer_rule({
	match = { namespace = "quickshell:popup" },
	xray = false,
	ignore_alpha = 1,
})
hl.layer_rule({ match = { namespace = "quickshell:mediaControls" }, ignore_alpha = 1 })
hl.layer_rule({ match = { namespace = "quickshell:session" }, ignore_alpha = 0 })

-- order override for on-screen keyboard
hl.layer_rule({ match = { namespace = "quickshell:osk" }, order = -1 })

-- Quickshell: waffles
hl.layer_rule({ match = { namespace = "quickshell:wallpaperSelector" }, animation = "slide top" })
local wafflesNoAnim = {
	"quickshell:wNotificationCenter",
	"quickshell:wOnScreenDisplay",
	"quickshell:wStartMenu",
	"quickshell:wTaskView",
}
for _, ns in ipairs(wafflesNoAnim) do
	hl.layer_rule({ match = { namespace = ns }, no_anim = true })
end
hl.layer_rule({ match = { namespace = "quickshell:wTaskView" }, ignore_alpha = 0 })

-- Launchers need to be FAST
hl.layer_rule({ match = { namespace = "gtk4-layer-shell" }, no_anim = true })
