#!/usr/bin/env fish

function run-darwin-pre
    running-message run-darwin-pre

    # install
    install-homebrew

    # update & upgrade
    if test "$RUN_DOTFILES_UPDATE" = true

        brew update
        brew upgrade
    else
        information-message "run dotfiles update flag not found, skipping update"
    end

    # prep
    copy-fonts
    touch-hushlogin

    # install
    install-gh
end
