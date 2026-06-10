#!/usr/bin/env fish

function run-darwin-pre
    running-message run-darwin-pre

    # install
    install-homebrew

    # add brew to PATH for this run; installer doesn't touch the live shell
    test -x /opt/homebrew/bin/brew; and fish_add_path -m /opt/homebrew/bin
    test -x /usr/local/bin/brew; and fish_add_path -m /usr/local/bin

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
end
