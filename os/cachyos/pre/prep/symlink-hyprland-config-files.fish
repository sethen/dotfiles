#!/usr/bin/env fish

function symlink-hyprland-config-files
    running-message symlink-hyprland-config-files

    # cachyos runs hyprland on the lua config provider. its hyprland.lua
    # requires config.monitors, which ships as a single `preferred` catch-all,
    # so this replaces that file outright rather than layering on top of it.
    # the rest of ~/.config/hypr/config stays as cachyos installed it.
    create-directory-if-not-exists $HOME_CONFIG_DIRECTORY/hypr/config

    make-symlink $DOTFILES_DIRECTORY/hypr/monitors.lua $HOME_CONFIG_DIRECTORY/hypr/config/monitors.lua

    # decorations.lua is cachyos's stock file with square corners, wider gaps
    # and omarchy's catppuccin border colors. the stock copy stays in
    # /etc/skel/.config/hypr/config.
    make-symlink $DOTFILES_DIRECTORY/hypr/decorations.lua $HOME_CONFIG_DIRECTORY/hypr/config/decorations.lua

    # variables.lua and workspaces.lua are cachyos's stock files with the
    # monitors named and five workspaces pinned to each (1-5 and 6-10), so each
    # monitor's bar shows its own workspaces
    make-symlink $DOTFILES_DIRECTORY/hypr/variables.lua $HOME_CONFIG_DIRECTORY/hypr/config/variables.lua
    make-symlink $DOTFILES_DIRECTORY/hypr/workspaces.lua $HOME_CONFIG_DIRECTORY/hypr/config/workspaces.lua
end
