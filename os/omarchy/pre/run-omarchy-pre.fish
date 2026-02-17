#!/usr/bin/env fish

function run-omarchy-pre
    running-message run-omarchy-pre

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true
        yay --noconfirm
    else
        information-message "run dotfiles update flag not found, skipping update"
    end

    # prep
    copy-fonts
end
