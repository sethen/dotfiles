#!/usr/bin/env fish

function symlink-yazi-config-directory
    running-message symlink-yazi-config-directory

    ln -sfv $DOTFILES_DIRECTORY/yazi $HOME_CONFIG_DIRECTORY
end
