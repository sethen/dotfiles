#!/usr/bin/env fish

function symlink-waybar-config-directory
    running-message symlink-waybar-config-directory

    make-symlink $DOTFILES_DIRECTORY/waybar $HOME_CONFIG_DIRECTORY/waybar
end
