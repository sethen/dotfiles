#!/usr/bin/env fish

function symlink-sesh-config-directory
    running-message symlink-sesh-config-directory

    ln -sfv $DOTFILES_DIRECTORY/sesh $HOME_CONFIG_DIRECTORY
end
