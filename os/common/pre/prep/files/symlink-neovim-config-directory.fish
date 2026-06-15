#!/usr/bin/env fish

function symlink-neovim-config-directory
    running-message symlink-neovim-config-directory

    make-symlink $DOTFILES_DIRECTORY/nvim $HOME_CONFIG_DIRECTORY/nvim
end
