#!/usr/bin/env fish

function make-mise-directory
    running-message make-mise-directory

    set -l HOME_MISE_DIRECTORY $HOME_CONFIG_DIRECTORY/mise

    if not test -d $HOME_MISE_DIRECTORY
        information-message "making mise directory"

        mkdir -p $HOME_MISE_DIRECTORY
    else
        success-message "mise directory already exists"
    end
end
