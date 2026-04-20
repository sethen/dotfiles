#!/usr/bin/env fish

function symlink-zellij-config-file
    running-message symlink-zellij-config-file

    ln -sfvn $DOTFILES_DIRECTORY/zellij/config.kdl $HOME_CONFIG_DIRECTORY/zellij/config.kdl
    ln -sfvn $DOTFILES_DIRECTORY/zellij/layouts $HOME_CONFIG_DIRECTORY/zellij/layouts
end
