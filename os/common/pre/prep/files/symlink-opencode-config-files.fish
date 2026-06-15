#!/usr/bin/env fish

function symlink-opencode-config-files
    running-message symlink-opencode-config-files

    set -l HOME_OPENCODE_DIRECTORY $HOME_CONFIG_DIRECTORY/opencode

    create-directory-if-not-exists $HOME_OPENCODE_DIRECTORY

    make-symlink $DOTFILES_DIRECTORY/opencode/themes $HOME_OPENCODE_DIRECTORY/themes
    make-symlink $DOTFILES_DIRECTORY/opencode/opencode.json $HOME_OPENCODE_DIRECTORY/opencode.json
end
