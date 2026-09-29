#!/usr/bin/env fish

function symlink-hyprland-config-files
    running-message symlink-hyprland-config-files

    # cachyos runs hyprland on the lua config provider. its hyprland.lua
    # requires config.monitors, which ships as a single `preferred` catch-all,
    # so this replaces that file outright rather than layering on top of it.
    # the rest of ~/.config/hypr/config stays as cachyos installed it.
    create-directory-if-not-exists $HOME_CONFIG_DIRECTORY/hypr/config

    make-symlink $DOTFILES_DIRECTORY/hypr/monitors.lua $HOME_CONFIG_DIRECTORY/hypr/config/monitors.lua
end
