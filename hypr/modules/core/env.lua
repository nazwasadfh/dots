-- =====================================================================
--  Environment variables (was: hyprland/env.conf)
--  See: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- =====================================================================

-- ############ Wayland #############
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
-- ######### Applications ##########
hl.env(
	"XDG_DATA_DIRS",
	os.getenv("HOME")
		.. "/.local/share/flatpak/exports/share:"
		.. "/var/lib/flatpak/exports/share:"
		.. "/usr/local/share:/usr/share"
)

-- ############ Themes ##############
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XDG_MENU_PREFIX", "plasma-")

-- ######## Virtual environment #####
hl.env("ILLOGICAL_IMPULSE_VIRTUAL_ENV", os.getenv("HOME") .. "/.local/state/quickshell/.venv")
