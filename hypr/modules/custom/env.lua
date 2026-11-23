-- =====================================================================
--  User environment overrides (was: custom/env.conf)
--  These are loaded after modules/core/env.lua and override / extend it.
-- =====================================================================

-- # Tearing
hl.env("WLR_DRM_NO_ATOMIC", "1")
-- # ?
hl.env("WLR_NO_HARDWARE_CURSORS", "1")

-- === Cursor Theme ===
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- ===== Dual-GPU (Intel iGPU + NVIDIA dGPU) =====
-- (intentionally commented-out in the original; keeping the env vars
--  available but disabled.)

-- # OpenGL: for Hyprland-NVIDIA we force the nvidia vendor
hl.env("LIBVA_DRIVER_NAME",          "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME",  "nvidia")
hl.env("__GL_VENDOR_LIBRARY_NAME",   "nvidia")
hl.env("GBM_BACKEND",                "nvidia")

-- # Manual rendering with buffer 1 is less GPU intensive during animations.
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "0")