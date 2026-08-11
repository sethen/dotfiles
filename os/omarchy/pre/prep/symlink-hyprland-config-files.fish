#!/usr/bin/env fish

function symlink-hyprland-config-files
    running-message symlink-hyprland-config-files

    make-symlink $DOTFILES_DIRECTORY/hypr/monitors.conf $HOME_CONFIG_DIRECTORY/hypr/monitors.conf
    make-symlink $DOTFILES_DIRECTORY/hypr/hyprlock.conf $HOME_CONFIG_DIRECTORY/hypr/hyprlock.conf

    make-symlink $DOTFILES_DIRECTORY/hypr/hypridle.conf $HOME_CONFIG_DIRECTORY/hypr/hypridle.conf
end
