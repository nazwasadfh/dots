# modules/

Lua configuration for Hyprland ≥ 0.55. `../hyprland.lua` is the entry point and
loads everything below in order — **later files override earlier ones**, exactly
like the old `source=` chain.

```
modules/
├── loader.lua        safe_require() (a broken file warns instead of aborting)
├── core/             shipped defaults
│   ├── env.lua           environment variables
│   ├── variables.lua     $terminal, $fileManager, $qsConfig, ...
│   ├── execs.lua         autostart (hyprland.start hooks)
│   ├── general.lua       gestures, general/input/decoration, base animations
│   ├── rules.lua         window / layer / workspace rules
│   ├── colors.lua        borders and background color
│   ├── keybinds.lua      keybindings
│   └── animations.lua    animation set #2 (bezier curves + leaves)
├── custom/           user overrides (loaded after core)
│   ├── env.lua
│   ├── variables.lua
│   ├── execs.lua
│   ├── general.lua       empty hook — put your hl.config overrides here
│   ├── rules.lua
│   ├── keybinds.lua
│   └── g.lua             INACTIVE reference (never loaded by the original)
├── shell/            quickshell integration + final look
│   ├── main.lua          ONE consolidated hl.config (final values)
│   └── animations.lua    final animation overrides
├── func/             runtime helpers used by keybind callbacks
│   ├── plugin-init.lua   hyprpm permission, plugin config (hyprflow, cursors)
│   ├── layout-cycle.lua  ALT+MOD3+←/→ layout cycling
│   ├── zoom.lua          SUPER+F / KP_± cursor zoom
│   ├── hlconfig.lua      caps:hyper, motion blur off
│   ├── per-layout-binds.lua  MOD3+A / MOD3+D per-layout actions
│   ├── hypr-wall.lua     wallpaper picker window rule
│   ├── eleven-workspace.lua  HYPER + MOD3 workspace binds
│   ├── facesearch.lua
│   ├── glass.lua         INACTIVE (fully commented)
│   └── hy3-layout.lua    INACTIVE (fully commented)
├── workspaces.lua    workspace → monitor mapping (generated as a loop)
└── monitors.lua      output modes/positions
```

## Editing rules

* Put personal changes in `modules/custom/` whenever possible; it loads after
  `core/` but **before** `shell/main.lua`, which is the final word on look &
  feel. If you need to beat `shell/`, add a call *after* it in `../hyprland.lua`.
* Keybind **order matters** when the same key is bound more than once: every
  match fires, in registration order. The old duplicates are preserved.
* Paths inside keybind commands (`~/.config/hypr/...`) are absolute on purpose:
  scripts still live in `../hyprland/scripts/` and `../func/`.
