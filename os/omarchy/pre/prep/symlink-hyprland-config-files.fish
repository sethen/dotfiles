#!/usr/bin/env fish

function symlink-hyprland-config-files
    running-message symlink-hyprland-config-files

    ln -sfv $DOTFILES_DIRECTORY/hypr/monitors.conf $HOME_CONFIG_DIRECTORY/hypr/
end
