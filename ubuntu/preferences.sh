#!/bin/zsh

information_message "running preferences"

# arc menu preferences
dconf write /org/gnome/shell/extensions/arc-menu/menu-button-icon "'System_Icon'"
dconf write /org/gnome/shell/extensions/arc-menu/custom-menu-button-icon-size 10.0
dconf write /org/gnome/shell/extensions/arc-menu/enable-menu-button-arrow false

# date and time on top bar preferences
dconf write /org/gnome/desktop/calendar/show-weekdate true
dconf write /org/gnome/desktop/interface/clock-show-date true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /org/gnome/desktop/datetime/automatic-timezone true
dconf write /org/gnome/desktop/interface/show-battery-percentage true

# dash to dock preferences
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme false
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-customize-running-dots true
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity 0.4
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-background-color true
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48
dconf write /org/gnome/shell/favorite-apps "[ 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'gparted.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'google-chrome.desktop', 'spotify.desktop', 'steam.desktop', 'gnome-system-monitor_gnome-system-monitor.desktop', 'org.gnome.Terminal.desktop', 'transmission-gtk.desktop', 'code.desktop', 'vlc.desktop', 'gnome-control-center.desktop' ]"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
dconf write /org/gnome/shell/extensions/dash-to-dock/running-indicator-style "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button false
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'FIXED'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
dconf write /org/gnome/shell/extensions/dash-to-dock/require-pressure-to-show true
dconf write /org/gnome/shell/extensions/dash-to-dock/pressure-threshold 0.0
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/background-color "'#000000'"

# extensions preferences
dconf write /org/gnome/shell/enabled-extensions "[ 'arc-menu@linxgem33.com', 'dash-to-dock@micxgx.gmail.com', 'openweather-extension@jenslody.de', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'desk-changer@eric.gach.gmail.com' ]"

# desktop preferences
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:////home/${USER}/Developer/wallpapers/e4944k_4svi-buzz-andersen.jpg'"

# icon preferences 
dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'standard'"

# openweather preferences
dconf write /org/gnome/shell/extensions/openweather/city "'33.9550905,-83.3881868>Athens, Athens - Clarke County, Georgia, 30609, United States of America >-1'"
dconf write /org/gnome/shell/extensions/openweather/position-in-panel "'center'"

# terminal preferences
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/palette "['rgb(33,33,33)', 'rgb(255,83,112)', 'rgb(195,232,141)', 'rgb(255,203,107)', 'rgb(130,170,255)', 'rgb(199,146,234)', 'rgb(137,221,255)', 'rgb(101,101,101)', 'rgb(85,85,85)', 'rgb(255,85,85)', 'rgb(85,255,85)', 'rgb(255,255,85)', 'rgb(85,85,255)', 'rgb(255,85,255)', 'rgb(85,255,255)', 'rgb(255,255,255)']"
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-transparency-percent 5
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-theme-transparency false
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/use-transparent-background true


# theme preferences
dconf write /org/gnome/desktop/interface/gtk-theme "'Arc'"
dconf write /org/gnome/desktop/interface/icon-theme "'Moka'"
dconf write /org/gnome/desktop/interface/cursor-theme "'DMZ-Black'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Arc-Dark'"
