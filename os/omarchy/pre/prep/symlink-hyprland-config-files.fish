#!/usr/bin/env fish

function symlink-hyprland-config-files
    running-message symlink-hyprland-config-files

    # omarchy 4 moved hyprland onto the lua config provider (hyprctl systeminfo
    # reports `configProvider: lua`). hyprland.lua requires hypr.monitors, and
    # the old monitors.conf is no longer read by anything.
    make-symlink $DOTFILES_DIRECTORY/hypr/monitors.lua $HOME_CONFIG_DIRECTORY/hypr/monitors.lua

    # hyprlock.conf and hypridle.conf used to be linked here. omarchy 4 dropped
    # both packages: the lock screen is the quickshell omarchy.lock plugin and
    # the idle timers live in omarchy/shell.json under `idle`.
end
