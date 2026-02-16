#!/usr/bin/env fish

function symlink-neovim-config-directory
    running-message symlink-neovim-config-directory

    set -l HOME_CONFIG_NEOVIM_DIRECTORY $HOME_CONFIG_DIRECTORY/nvim

    delete-if-exists $HOME_CONFIG_NEOVIM_DIRECTORY

    ln -sfnv $DOTFILES_DIRECTORY/nvim $HOME_CONFIG_DIRECTORY
end
