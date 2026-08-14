-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported modes with: hyprctl monitors all
--
-- omarchy 4 moved hyprland onto the lua config provider, so this replaces the
-- old hypr/monitors.conf. hyprland.lua requires this file after omarchy's
-- defaults, which is why the settings here win.

-- toolkit scale for GTK apps. hyprland scales per-monitor, but GTK reads this
-- once at app start, so it stays global.
hl.env("GDK_SCALE", "2")

-- catch-all first, so a monitor plugged in later still lands somewhere sane.
-- the specific entries below override it for the two that are always here.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- BNQ ZOWIE XL — 1080p60, left of the ASUS.
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60.00Hz", position = "auto", scale = "auto" })

-- ASUS PG32UCDM — 4K240. the panel defaults to 60Hz when the mode is left at
-- "preferred", so the refresh rate has to be named explicitly. scale 1.5 puts
-- it at an effective 2560x1440 next to the 1080p panel.
hl.monitor({ output = "DP-2", mode = "3840x2160@240.02Hz", position = "auto", scale = 1.5 })
