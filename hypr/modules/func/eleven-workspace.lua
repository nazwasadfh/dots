local keys = {
	{ "1", 11 },
	{ "2", 12 },
	{ "3", 13 },
	{ "4", 14 },
	{ "5", 15 },
	{ "6", 16 },
	{ "7", 17 },
	{ "8", 18 },
	{ "9", 19 },
	{ "0", 20 },
	{ "k", 3214 },
}
hl.bind("HYPER_L", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })
hl.bind(
	"HYPER_L",
	hl.dsp.exec_cmd("brightnessctl -d input2::capslock set 1"),
	{ repeating = true, ignore_mods = true, transparent = true }
)
--hl.bind("HYPER_L", hl.dsp.exec_cmd("notify-send 'HyperL Key detected'"))
hl.bind(
	"HYPER_L",
	hl.dsp.exec_cmd("brightnessctl -d input2::capslock set 0"),
	{ release = true, ignore_mods = true, transparent = true }
)

--repeating = true, ignore_mods = true, transparent = tru
for _, key in ipairs(keys) do
	hl.bind("MOD3 + " .. key[1], hl.dsp.focus({ workspace = key[2] }), {
		description = "Switch to workspace " .. key[2],
	})
end
for _, key in ipairs(keys) do
	hl.bind(
		"MOD3 + SHIFT + " .. key[1],
		hl.dsp.window.move({
			workspace = key[2],
			follow = true,
		}),
		{
			description = "Move window to workspace " .. key[2],
		}
	)
end
