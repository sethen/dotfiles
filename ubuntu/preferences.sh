#!/bin/zsh

information_message "running preferences"

# date and time on top bar preferences
dconf write /org/gnome/desktop/calendar/show-weekdate true
dconf write /org/gnome/desktop/interface/clock-show-date true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /org/gnome/desktop/datetime/automatic-timezone true
dconf write /org/gnome/desktop/interface/show-battery-percentage true

# dash to dock preferences
dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme false
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity 0.4
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-background-color true
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Calculator.desktop', 'org.gnome.Calendar.desktop', 'gparted.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'google-chrome.desktop', 'spotify.desktop', 'steam.desktop', 'gnome-system-monitor.desktop', 'org.gnome.Terminal.desktop', 'transmission-gtk.desktop', 'code.desktop', 'vlc.desktop', 'gnome-control-center.desktop', 'org.gnome.tweaks.desktop' ]"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
dconf write /org/gnome/shell/extensions/dash-to-dock/running-indicator-style "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button true
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'FIXED'"
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
dconf write /org/gnome/shell/extensions/dash-to-dock/require-pressure-to-show true
dconf write /org/gnome/shell/extensions/dash-to-dock/pressure-threshold 0.0
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false

# extensions preferences
dconf write /org/gnome/shell/enabled-extensions "[ 'dash-to-dock@micxgx.gmail.com', 'openweather-extension@jenslody.de', 'user-theme@gnome-shell-extensions.gcampax.github.com' ]"

# desktop preferences
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:////home/${USER}/Developer/wallpapers/e4944k_4svi-buzz-andersen.jpg'"

# icon preferences 
dconf write /org/gnome/nautilus/icon-view/default-zoom-level "'standard'"

# openweather preferences
dconf write /org/gnome/shell/extensions/openweather/city "'33.9550905,-83.3881868>Athens, Athens - Clarke County, Georgia, 30609, United States of America >-1'"
dconf write /org/gnome/shell/extensions/openweather/position-in-panel "'center'"

# theme preferences
dconf write /org/gnome/desktop/interface/gtk-theme "'Arc'"
dconf write /org/gnome/desktop/interface/icon-theme "'Arc-Maia'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Arc-Dark'"
dconf write /org/gnome/desktop/interface/cursor-theme "'DMZ-Black'"
