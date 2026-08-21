#!/usr/bin/env fish

function make-bun-directory
    running-message make-bun-directory

    create-directory-if-not-exists $BUN_INSTALL/bin
end
