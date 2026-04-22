#!/usr/bin/env fish

function symlink-opencode-config-files
    running-message symlink-opencode-config-directory

    set -l HOME_OPENCODE_DIRECTORY $HOME_CONFIG_DIRECTORY/opencode

    delete-if-exists $HOME_OPENCODE_DIRECTORY
    mkdir $HOME_OPENCODE_DIRECTORY

    ln -sfv $DOTFILES_DIRECTORY/opencode/themes $HOME_OPENCODE_DIRECTORY
    ln -sfv $DOTFILES_DIRECTORY/opencode/opencode.json $HOME_OPENCODE_DIRECTORY
end
