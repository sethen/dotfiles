#!/usr/bin/env fish

function symlink-herdr-config
    running-message symlink-herdr-config

    set -l HOME_HERDR_DIRECTORY $HOME_CONFIG_DIRECTORY/herdr

    create-directory-if-not-exists $HOME_HERDR_DIRECTORY

    make-symlink $DOTFILES_DIRECTORY/herdr/config.toml $HOME_HERDR_DIRECTORY/config.toml
end
