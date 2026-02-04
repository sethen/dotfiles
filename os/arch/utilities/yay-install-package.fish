#!/usr/bin/env fish

function yay-install-package
    running-message yay-install-package

    set PACKAGE $argv[1]

    if not pacman -Qs $PACKAGE >/dev/null
        information-message "installing $PACKAGE"

        yay install -S $PACKAGE --noconfirm
    else
        success-message "$PACKAGE already installed"
    end
end
