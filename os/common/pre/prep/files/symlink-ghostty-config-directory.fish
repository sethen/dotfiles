#!/usr/bin/env fish

function symlink-ghostty-config-directory
    running-message symlink-ghostty-config-directory

    ln -sfv $DOTFILES_DIRECTORY/ghostty $HOME_CONFIG_DIRECTORY
end
