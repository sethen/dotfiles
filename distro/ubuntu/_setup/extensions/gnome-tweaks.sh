#!/bin/zsh

dconf write /org/gnome/desktop/interface/gtk-theme "'Yaru-blue-dark'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Colloid-Dark'"
dconf write /org/gnome/desktop/interface/clock-show-seconds true
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gtk/settings/file-chooser/clock-format "'12h'"
dconf write /org/gnome/desktop/datetime/automatic-timezone true
