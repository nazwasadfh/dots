-- =====================================================================
--  Variables (was: hyprland/variables.conf)
--  In hyprlang these were `$terminal = ...` style defs; in Lua they are
--  simply local variables shared through `require`.
--  Override them in modules/custom/variables.lua (loaded right after
--  this file, before anything consumes the values).
-- =====================================================================

-- The `launch_first_available.sh` script picks the first command that
-- actually exists on PATH and runs it. Kept as-is for compatibility.

-- Apps
-- PULL REQUESTS ADDING MORE WILL NOT BE ACCEPTED, CONFIG FOR YOURSELF
local terminal = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"kitty -1" "foot" "alacritty" "wezterm" "konsole" "kgx" "uxterm" "xterm"'

local fileManager = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"dolphin" "nautilus" "nemo" "thunar" "kitty -1 fish -c yazi"'

local browser = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"google-chrome-stable" "zen-browser" "firefox" "brave" "chromium" '
    .. '"microsoft-edge-stable" "opera" "librewolf"'

local codeEditor = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"antigravity" "code" "codium" "cursor" "zed" "zedit" "zeditor" '
    .. '"kate" "gnome-text-editor" "emacs" '
    .. '"command -v nvim && kitty -1 nvim" '
    .. '"command -v micro && kitty -1 micro"'

local officeSoftware = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"wps" "onlyoffice-desktopeditors" "libreoffice"'

local textEditor = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"kate" "gnome-text-editor" "emacs"'

local volumeMixer = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"pavucontrol-qt" "pavucontrol"'

local settingsApp = "XDG_CURRENT_DESKTOP=gnome "
    .. "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"qs -p ~/.config/quickshell/$qsConfig/settings.qml" '
    .. '"systemsettings" "gnome-control-center" "better-control"'

local taskManager = "~/.config/hypr/hyprland/scripts/launch_first_available.sh "
    .. '"gnome-system-monitor" '
    .. '"plasma-systemmonitor --page-name Processes" '
    .. '"command -v btop && kitty -1 fish -c btop"'

-- The folder within ~/.config/quickshell containing the config
local qsConfig = "end4-pC"

-- Leave blank like this to load default config. Set to anything to not.
local dontLoadDefaultExecs    = ""
local dontLoadDefaultGeneral  = ""
local dontLoadDefaultRules    = ""
local dontLoadDefaultKeybinds = ""

-- ---------------------------------------------------------------------
--  Export the locals for other Lua files to use.
--  In hyprlang these were global `$VAR`s, in Lua we expose them via a
--  shared module table. The `custom.variables` file can reassign any
--  of them by doing `require("hyprland.variables").terminal = "..."`.
-- ---------------------------------------------------------------------
return {
    terminal             = terminal,
    fileManager          = fileManager,
    browser              = browser,
    codeEditor           = codeEditor,
    officeSoftware       = officeSoftware,
    textEditor           = textEditor,
    volumeMixer          = volumeMixer,
    settingsApp          = settingsApp,
    taskManager          = taskManager,
    qsConfig             = qsConfig,
    dontLoadDefaultExecs = dontLoadDefaultExecs,
    dontLoadDefaultGeneral = dontLoadDefaultGeneral,
    dontLoadDefaultRules = dontLoadDefaultRules,
    dontLoadDefaultKeybinds = dontLoadDefaultKeybinds,
}
