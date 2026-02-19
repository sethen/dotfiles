#!/usr/bin/env fish

function symlink-waybar-config-directory
    running-message symlink-waybar-config-directory

    set -l HOME_WAYBAR_DIRECTORY $HOME_CONFIG_DIRECTORY/waybar

    delete-if-exists $HOME_WAYBAR_DIRECTORY

    ln -sfv $DOTFILES_DIRECTORY/waybar $HOME_CONFIG_DIRECTORY
end
