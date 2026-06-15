#!/usr/bin/env fish

function symlink-zellij-config-file
    running-message symlink-zellij-config-file

    make-symlink $DOTFILES_DIRECTORY/zellij/config.kdl $HOME_CONFIG_DIRECTORY/zellij/config.kdl
    make-symlink $DOTFILES_DIRECTORY/zellij/layouts $HOME_CONFIG_DIRECTORY/zellij/layouts
end
