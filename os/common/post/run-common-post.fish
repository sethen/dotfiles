#!/usr/bin/env fish

function run-common-post
    running-message run-common-post

    if test "$RUN_DOTFILES_REBOOT" = true
        reboot-system
    else
        confirm-reboot-system
    end
end
