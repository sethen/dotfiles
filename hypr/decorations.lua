-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        -- omarchy's catppuccin border: the theme accent (mocha blue) on the
        -- focused window, translucent gray on the rest
        col = {
            active_border = "rgb(89b4fa)",
            inactive_border = "rgba(595959aa)",
        },
    },
    -- no window or workspace slide animations; everything switches instantly
    animations = {
        enabled = false,
    },
    -- adwaita only ships as an xcursor theme. with hyprcursor on, hyprland
    -- can't find it as a hyprcursor theme and falls back to bibata, the only
    -- one installed, so hyprcursor is off and XCURSOR_THEME below is used
    cursor = {
        enable_hyprcursor = false,
    },
    decoration = {
        active_opacity = 0.95,
        inactive_opacity = 0.85,
        blur = {
            size = 5,
            passes = 4,
            special = true,
        },
    },
})

-- plain adwaita arrow instead of cachyos's bibata (from ~/.config/uwsm/env)
hl.env("XCURSOR_THEME", "Adwaita")
