#!/usr/bin/env fish

function symlink-ghostty-config-directory
    running-message symlink-ghostty-config-directory

    set -l HOME_GHOSTTY_NEOVIM_DIRECTORY $HOME_CONFIG_DIRECTORY/ghostty

    delete-if-exists $HOME_GHOSTTY_NEOVIM_DIRECTORY

    ln -sfv $DOTFILES_DIRECTORY/ghostty $HOME_CONFIG_DIRECTORY
end
