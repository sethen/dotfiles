#!/usr/bin/env fish

function symlink-btop-config-directory
    running-message symlink-btop-config-directory

    make-symlink $DOTFILES_DIRECTORY/btop $HOME_CONFIG_DIRECTORY/btop
end
