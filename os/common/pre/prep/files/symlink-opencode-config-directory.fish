#!/usr/bin/env fish

function symlink-opencode-config-directory
    running-message symlink-opencode-config-directory

    set -l HOME_OPENCODE_DIRECTORY $HOME_CONFIG_DIRECTORY/opencode

    delete-if-exists $HOME_OPENCODE_DIRECTORY

    ln -sfv $DOTFILES_DIRECTORY/opencode $HOME_CONFIG_DIRECTORY
end
