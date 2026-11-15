-- exec (on file reload)
hl.exec_cmd("hyprctl dispatch submap global")
--hl.bind("SUPER+P",)
-- Keybindings
hl.bind("CTRL+SUPER_L", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("CTRL + SUPER_R", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse:272", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse:273", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse:274", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse:275", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse:276", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse:277", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse_up", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + mouse_down", hl.dsp.global("quickshell:searchToggleReleaseInterrupt"))
hl.bind("SUPER + E", hl.dsp.global("quickshell:overviewWorkspacesToggle"))
hl.bind("SUPER + A", hl.dsp.global("quickshell:sidebarLeftToggle"))
hl.bind("SUPER+ALT + A", hl.dsp.global("quickshell:sidebarLeftToggleDetach"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + G", hl.dsp.global("quickshell:overlayToggle"))
hl.bind(
	"CTRL+ALT + DELETE",
	hl.dsp.exec_cmd("qs -c end4-pC ipc call TEST_ALIVE || pkill wlogout || wlogout -p layer-shell")
)
hl.bind("SHIFT+SUPER+ALT + SLASH", hl.dsp.exec_cmd("qs -p ~/.config/quickshell/end4-pC/welcome.qml"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })
hl.bind("CTRL+SUPER + R", hl.dsp.exec_cmd("killall ydotool qs quickshell; qs -c end4-pC &"))
hl.bind("CTRL+SUPER + P", hl.dsp.global("quickshell:panelFamilyCycle"))
--hl.bind("SUPER+SHIFT + S", hl.dsp.global("quickshell:regionScreenshot"))
--hl.bind("SUPER+SHIFT + S", hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || pidof slurp || hyprshot --freeze --clipboard-only --mode region --silent"))
hl.bind("SUPER+SHIFT + A", hl.dsp.global("quickshell:regionSearch"))
hl.bind(
	"SUPER+SHIFT + A",
	hl.dsp.exec_cmd(
		"qs -c $qsConfig ipc call TEST_ALIVE || pidof slurp || ~/.config/hypr/hyprland/scripts/snip_to_search.sh"
	)
)
hl.bind("SUPER+SHIFT + X", hl.dsp.global("quickshell:regionOcr"))
hl.bind("SUPER+SHIFT + T", hl.dsp.global("quickshell:screenTranslate"))
--hl.bind("SUPER+SHIFT + X", hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || pidof slurp || grim -g "$(slurp $SLURP_ARGS)" "/tmp/ocr_image.png" && tesseract "/tmp/ocr_image.png" stdout -l $(tesseract --list-langs | awk 'NR>1{print $1}' | tr '\\n' '+' | sed 's/\\+$/\\n/') | wl-copy && rm "/tmp/ocr_image.png""))
hl.bind("SUPER+SHIFT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true })
hl.bind(
	"SUPER+SHIFT + R",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/quickshell/$qsConfig/scripts/videos/record.sh"),
	{ locked = true }
)
hl.bind("SUPER+ALT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true })
hl.bind(
	"SUPER+ALT + R",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/quickshell/$qsConfig/scripts/videos/record.sh"),
	{ locked = true }
)
hl.bind(
	"CTRL+ALT + R",
	hl.dsp.exec_cmd("~/.config/quickshell/$qsConfig/scripts/videos/record.sh --fullscreen"),
	{ locked = true }
)
hl.bind(
	"SUPER+SHIFT+ALT + R",
	hl.dsp.exec_cmd("~/.config/quickshell/$qsConfig/scripts/videos/record.sh --fullscreen --sound"),
	{ locked = true }
)
--hl.bind("PRINT", hl.dsp.exec_cmd("grim -o "$(hyprctl activeworkspace -j | jq -r '.monitor')" - | wl-copy"), { locked = true })
hl.bind("SUPER + mouse:272", hl.dsp.window.move({ direction = "left" }), { mouse = true })
hl.bind("SUPER + mouse:274", hl.dsp.window.move({ direction = "right" }), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + BracketLeft", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + BracketRight", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER+SHIFT + Left", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER+SHIFT + Right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER+SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
hl.bind("SUPER+SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
hl.bind("SUPER+CTRL+ Left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER+CTRL + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER+CTRL + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER+CTRL + Down", hl.dsp.window.move({ direction = "d" }))
hl.bind("ALT + F4", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER+ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER+ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + Apostrophe", hl.dsp.layout("splitratio +0.1"), { repeating = true })
hl.bind("SUPER+ALT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + X", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + Z", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
--hl.bind("SUPER+ALT + F", hl.dsp.fullscreenstate("0 3"))
hl.bind("SUPER + P", hl.dsp.window.pin())
hl.bind("SUPER+SHIFT + code:10", hl.dsp.window.move({ workspace = 1, follow = true }))
hl.bind("SUPER+SHIFT + code:11", hl.dsp.window.move({ workspace = 2, follow = true }))
hl.bind("SUPER+SHIFT + code:12", hl.dsp.window.move({ workspace = 3, follow = true }))
hl.bind("SUPER+SHIFT + code:13", hl.dsp.window.move({ workspace = 4, follow = true }))
hl.bind("SUPER+SHIFT + code:14", hl.dsp.window.move({ workspace = 5, follow = true }))
hl.bind("SUPER+SHIFT + code:15", hl.dsp.window.move({ workspace = 6, follow = true }))
hl.bind("SUPER+SHIFT + code:16", hl.dsp.window.move({ workspace = 7, follow = true }))
hl.bind("SUPER+SHIFT + code:17", hl.dsp.window.move({ workspace = 8, follow = true }))
hl.bind("SUPER+SHIFT + code:18", hl.dsp.window.move({ workspace = 9, follow = true }))
hl.bind("SUPER+SHIFT + code:19", hl.dsp.window.move({ workspace = 10, follow = true }))

hl.bind("SUPER+SHIFT + S", hl.dsp.window.move({ workspace = "special", follow = true }))
hl.bind("SUPER+SHIFT + O", hl.dsp.window.move({ workspace = "special:MANIFEST", follow = true }))

hl.bind("SUPER+SHIFT + D", hl.dsp.window.move({ workspace = "special:SOCIAL", follow = true }))

hl.bind("SUPER + code:10", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + code:11", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + code:12", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + code:13", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + code:14", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + code:15", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + code:16", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + code:17", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + code:18", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + code:19", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("special"))
hl.bind("SUPER + O", hl.dsp.workspace.toggle_special("MANIFEST"))
hl.bind("SUPER+D", hl.dsp.workspace.toggle_special("SOCIAL"))
hl.bind("CTRL+SUPER + BracketLeft", hl.dsp.focus({ workspace = "-1" }))
hl.bind("CTRL+SUPER + BracketRight", hl.dsp.focus({ workspace = "+1" }))
hl.bind(
	"SUPER+ALT + F1",
	hl.dsp.exec_cmd(
		"notify-send 'Entered Virtual Machine submap' 'Keybinds disabled. Hit SUPER+ALT+F1 to escape' -a 'Hyprland' && hyprctl dispatch submap virtual-machine"
	)
)
hl.bind(
	"SUPER+ALT + F1",
	hl.dsp.exec_cmd(
		"notify-send 'Exited Virtual Machine submap' 'Keybinds re-enabled' -a 'Hyprland' && hyprctl dispatch submap global"
	)
)
--hl.bind("SUPER+ALT + f11", hl.dsp.exec_cmd("bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i "nipple" | grep -v -i "pussy" | shuf -n 1); ACTION=$(notify-send "Test notification with body image" "This notification should contain your user account <b>image</b> and <a href=\"https://discord.com/app\">Discord</a> <b>icon</b>. Oh and here is a random image in your Pictures folder: <img src=\"$RANDOM_IMAGE\" alt=\"Testing image\"/>" -a "Hyprland keybind" -p -h "string:image-path:/var/lib/AccountsService/icons/$USER" -t 6000 -i "discord" -A "openImage=Profile image" -A "action2=Open the random image" -A "action3=Useless button"); [[ $ACTION == *openImage ]] && xdg-open "/var/lib/AccountsService/icons/$USER"; [[ $ACTION == *action2 ]] && xdg-open \"$RANDOM_IMAGE\"'"))
--hl.bind("SUPER+ALT + f12", hl.dsp.exec_cmd("bash -c 'RANDOM_IMAGE=$(find ~/Pictures -type f | grep -v -i "nipple" | grep -v -i "pussy" | shuf -n 1); ACTION=$(notify-send "Test notification" "This notification should contain a random image in your <b>Pictures</b> folder and <a href=\"https://discord.com/app\">Discord</a> <b>icon</b>.\n<i>Flick right to dismiss!</i>" -a "Discord (fake)" -p -h "string:image-path:$RANDOM_IMAGE" -t 6000 -i "discord" -A "openImage=Profile image" -A "action2=Useless button"); [[ $ACTION == *openImage ]] && xdg-open "/var/lib/AccountsService/icons/$USER"'"))
--hl.bind("SUPER+ALT + Equal", hl.dsp.exec_cmd("notify-send "Urgent notification" "Ah hell no" -u critical -a 'Hyprland keybind'"))
hl.bind("SUPER + Minus", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.3"), { repeating = true })
hl.bind("SUPER + Equal", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/zoom.sh increase 0.3"), { repeating = true })
hl.bind("SUPER + code:82", hl.dsp.exec_cmd("qs -c $qsConfig ipc call zoom zoomOut"), { repeating = true })
hl.bind("SUPER + code:86", hl.dsp.exec_cmd("qs -c $qsConfig ipc call zoom zoomIn"), { repeating = true })
hl.bind(
	"SUPER + code:82",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh decrease 0.1"),
	{ repeating = true }
)
hl.bind(
	"SUPER + code:86",
	hl.dsp.exec_cmd("qs -c $qsConfig ipc call TEST_ALIVE || ~/.config/hypr/hyprland/scripts/zoom.sh increase 0.1"),
	{ repeating = true }
)
hl.bind("SUPER+SHIFT + N", hl.dsp.exec_cmd("playerctl -p spotify next"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("SUPER+SHIFT+ALT + mouse:275", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("SUPER+SHIFT+ALT + mouse:276", hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER+SHIFT + B", hl.dsp.exec_cmd("playerctl -p spotify previous"), { locked = true })
hl.bind("SUPER+SHIFT + V", hl.dsp.exec_cmd("playerctl -p spotify play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("SUPER + R", hl.dsp.exec_cmd("/home/imfl/.local/bin/rofi-hub"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SHIFT+ALT + A", hl.dsp.exec_cmd("~/wpapermgr/air/launch"))
hl.bind("CTRL+ALT + A", hl.dsp.exec_cmd("ani-cli --dub --rofi"))
--hl.bind("SUPER + TAB", hl.dsp.exec_cmd("rofi -show"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("sh -c /home/imfl/.local/bin/omafiles"))
hl.bind("SUPER+SHIFT + W", hl.dsp.exec_cmd("~/wpapermgr/modules/ani-cli"))
hl.bind("CTRL+SUPER + V", hl.dsp.exec_cmd("$volumeMixer"))
hl.bind("SUPER + I", hl.dsp.global("quickshell:settings"))
hl.bind("CTRL+SHIFT + Escape", hl.dsp.exec_cmd("$taskManager"))
hl.bind("SUPER + H", hl.dsp.exec_cmd("edex-ui"))
--hl.bind("CTRL+SUPER + Backslash", hl.dsp.window.resize({ x = exact, y = 640 }))
hl.bind("CTRL+SUPER + X", hl.dsp.exec_cmd("~/kira/rec/record_start.sh"))
hl.bind("CTRL+SUPER + X", hl.dsp.exec_cmd("~/kira/rec/record_stop.sh"), { release = true })
--hl.bind("CTRL+SHIFT + V", hl.dsp.exec_cmd("wl-paste"))

hl.bind("SUPER_L", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })
hl.bind("SUPER_R", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })

hl.bind("SUPER+V", hl.dsp.global("quickshell:overviewClipboardToggle"))

-- [failes migration] bindd = SUPER, Period, Emoji >> clipboard, global, quickshell:overviewEmojiToggle # Emoji >> clipboard
hl.bind("SUPER+N", hl.dsp.global("quickshell:sidebarRightToggle"))

hl.bind("SUPER+K", hl.dsp.global("quickshell:oskToggle"))

hl.bind("SUPER+M", hl.dsp.global("quickshell:mediaControlsToggle"))

hl.bind("CTRL+ALT+Delete", hl.dsp.global("quickshell:sessionToggle"))

hl.bind("SUPER+J", hl.dsp.global("quickshell:barToggle"))

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("qs -c end4-pC ipc call brightness increment || brightnessctl s 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("qs -c end4-pC ipc call brightness decrement || brightnessctl s 5%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 2.0"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)

hl.bind("SUPER+SHIFT+M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true })

hl.bind("SUPER+ALT+M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"), { locked = true })

hl.bind("SUPER+W", hl.dsp.global("quickshell:wallpaperSelectorToggle"))

hl.bind("SUPER+ALT+W", hl.dsp.global("quickshell:wallpaperSelectorRandom"))
hl.bind("MOD3+J", hl.dsp.exec_cmd("dolphin"))
-- [failes migration] bindd = CTRL+SUPER, W, Change wallpaper, exec, qs -c end4-pC ipc call TEST_ALIVE || ~/.config/quickshell/end4-pC/scripts/colors/switchwall.sh # [hidden] Change wallpaper (fallback)
--hl.bind("MOD3", hl.dsp.exec_cmd("kitty"), { repeating = true, ignore_mods = true, transparent = true })
hl.bind("SUPER+SHIFT+P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("SUPER+L", hl.dsp.global("quickshell:lock"))
hl.bind("SUPER+L", hl.dsp.exec_cmd("~/mont/umnt-smok"))
hl.bind("SUPER+SHIFT+ALT+ mouse:273", hl.dsp.exec_cmd("~/.config/hypr/hyprland/scripts/ai/primary-buffer-query.sh"))

--hl.bind("ALT+End", hl.dsp.exec_cmd("kitty --class clipse -e clipse", { float = true, size = {622, 652}, stay_focused = true }))
hl.bind("ALT+Delete", hl.dsp.exec_cmd("wl-copy --trim-newline"))
hl.bind("ALT+Insert", hl.dsp.exec_cmd('wtype "$(wl-paste -p )"'))
hl.bind("SHIFT+ALT+Insert", hl.dsp.exec_cmd('wtype "$(wl-paste)"'))

hl.bind(
	"CTRL+SUPER+T",
	hl.dsp.exec_cmd("/opt/brave-bin/brave --profile-directory=Default --app-id=lpipgeiacpaglellehncakfgeocckkdb")
)

hl.bind("SUPER+SHIFT+C", hl.dsp.exec_cmd("~/.config/hypr/func/loop-control"))

hl.bind("SUPER+I", hl.dsp.exec_cmd("qs -c end4-pC ipc call settings toggle"))
--hl.bind("MOD3+J", hl.dsp.exec_cmd("kitty cowsay dik")

hl.bind("MOD3+L", hl.dsp.exec_cmd("/home/imfl/.local/bin/hylock"))
