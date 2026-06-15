#!/usr/bin/env fish

function make-config-directory
    running-message make-config-directory

    create-directory-if-not-exists $HOME_CONFIG_DIRECTORY
end
