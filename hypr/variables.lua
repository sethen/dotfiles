-- Hyprland default apps

TERMINAL     = "kitty"
FILE_MANAGER = "nautilus"
BROWSER      = "firefox"
-- nvim comes from mise, which hyprland's PATH does not include, so launch it
-- through fish, whose config.fish activates mise
EDITOR       = TERMINAL .. " fish -c nvim"
CALCULATOR   = "gnome-calculator"

-- config.fish sets DEVELOPER_DIRECTORY, but the greeter starts hyprland without
-- a fish login shell, so apps it launches (kitty, whose session files need it)
-- only see it if it is set here. asking fish keeps config.fish the one place
-- it is defined
hl.env("DEVELOPER_DIRECTORY", io.popen("fish -c 'echo $DEVELOPER_DIRECTORY'"):read("l"))

-- Monitors
MONITOR1 = "HDMI-A-1"
MONITOR2 = "DP-2"
MONITOR3 = ""
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 5 -- Number of workspaces per monitor (Max 10)
