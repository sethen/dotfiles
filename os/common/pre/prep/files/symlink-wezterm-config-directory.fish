#!/usr/bin/env fish

function symlink-wezterm-config-directory
    running-message symlink-wezterm-config-directory

    make-symlink $DOTFILES_DIRECTORY/wezterm $HOME_CONFIG_DIRECTORY/wezterm
end
