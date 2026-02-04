#!/usr/bin/env fish

function set-gnome-preferences
    running-message set-gnome-preferences

    # settings
    dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 82
    dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
    dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
    dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false
    dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'brave-browser.desktop', 'org.gnome.Calculator.desktop', 'com.mitchellh.ghostty.desktop', 'gpick.desktop', 'gparted.desktop', 'google-chrome.desktop',  'vlc.desktop', 'org.gnome.Settings.desktop', 'org.gnome.tweaks.desktop']"
    dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
    dconf write /org/gnome/shell/extensions/dash-to-dock/show-show-apps-button false
    dconf write /org/gnome/shell/extensions/dash-to-dock/show-trash false

    # interface
    dconf write /org/gnome/desktop/interface/gtk-theme "'Yaru-blue-dark'"
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    dconf write /org/gnome/desktop/interface/icon-theme "'WhiteSur-dark'"
    dconf write /org/gnome/desktop/interface/clock-show-seconds true
    dconf write /org/gnome/desktop/interface/clock-show-weekday true
    dconf write /org/gnome/desktop/interface/clock-format "'12h'"
    dconf write /org/gnome/desktop/datetime/automatic-timezone true
    dconf write /org/gnome/desktop/interface/clock-show-date true
end
