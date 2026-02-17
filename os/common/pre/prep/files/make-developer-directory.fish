#!/usr/bin/env fish

function make-developer-directory
    running-message make-developer-directory

    create-directory-if-not-exists $DEVELOPER_DIRECTORY
end
