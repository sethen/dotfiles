#!/usr/bin/env fish

function make-mise-directory
    running-message make-mise-directory

    set -l HOME_MISE_DIRECTORY $HOME_CONFIG_DIRECTORY/mise

    create-directory-if-not-exists $HOME_MISE_DIRECTORY
end
