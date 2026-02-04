#!/usr/bin/env fish

function brew-cask-install-package
    running-message brew-cask-install-package

    set CASK $argv[1]

    if not brew list --cask | grep -w $CASK >/dev/null
        information-message "installing $CASK"
        brew install --cask $CASK
    else
        success-message "$CASK already installed"
    end
end
