#!/usr/bin/env fish

function symlink-fish-config-file
    running-message symlink-fish-config-file

    set -l DOTFILES_OS_CONFIG_FILE $DOTFILES_DIRECTORY/config.fish
    set -l HOME_FISH_CONFIG_FILE $HOME_FISH_DIRECTORY/config.fish

    delete-if-exists HOME_FISH_CONFIG_FILE

    if test -f $DOTFILES_OS_CONFIG_FILE
        ln -sfv $DOTFILES_OS_CONFIG_FILE $HOME_FISH_CONFIG_FILE
    end
end
