#!/usr/bin/env fish

function symlink-yazi-config-directory
    running-message symlink-yazi-config-directory

    make-symlink $DOTFILES_DIRECTORY/yazi $HOME_CONFIG_DIRECTORY/yazi
end
