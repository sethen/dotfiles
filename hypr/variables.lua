-- Hyprland default apps

TERMINAL     = "kitty"
FILE_MANAGER = "dolphin"
BROWSER      = "firefox"
-- nvim comes from mise, which hyprland's PATH does not include, so launch it
-- through fish, whose config.fish activates mise
EDITOR       = TERMINAL .. " fish -c nvim"
CALCULATOR   = "gnome-calculator"

-- Monitors
MONITOR1 = "HDMI-A-1"
MONITOR2 = "DP-2"
MONITOR3 = ""
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 5 -- Number of workspaces per monitor (Max 10)
