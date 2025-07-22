#!/bin/zsh

echo ''
header-message "$DESKTOP setup"
echo ''

# settings

# dash to dock
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'brave-browser.desktop', 'org.gnome.Calculator.desktop', 'gpick.desktop', 'gparted.desktop', 'google-chrome.desktop', 'kitty.desktop', 'vlc.desktop', 'org.gnome.Settings.desktop', 'org.gnome.tweaks.desktop']"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash false

# interface
dconf write /org/gnome/desktop/interface/gtk-theme "'Yaru-blue-dark'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Colloid-Dark'"
dconf write /org/gnome/desktop/interface/clock-show-seconds true
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gtk/settings/file-chooser/clock-format "'12h'"
dconf write /org/gnome/desktop/datetime/automatic-timezone true
dconf write /org/gnome/desktop/interface/clock-show-date true

information-message 'cloning repositories'

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/desktop/$DESKTOP/_setup/repositories/colloid-icon-theme.sh
