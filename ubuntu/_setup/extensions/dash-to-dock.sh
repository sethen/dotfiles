#!/bin/zsh

dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Calculator.desktop', 'gpick.desktop', 'org.gnome.Calendar.desktop', 'gparted.desktop', 'google-chrome.desktop', 'kitty.desktop', 'transmission-gtk.desktop', 'vlc.desktop']"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts false
