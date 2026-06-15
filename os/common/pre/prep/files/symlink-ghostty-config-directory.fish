#!/usr/bin/env fish

function symlink-ghostty-config-directory
    running-message symlink-ghostty-config-directory

    make-symlink $DOTFILES_DIRECTORY/ghostty $HOME_CONFIG_DIRECTORY/ghostty
end
