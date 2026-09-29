#!/usr/bin/env fish

function pacman-install-package
    running-message pacman-install-package

    set -l PACKAGE $argv[1]

    # `pacman -Q` matches the package name exactly. -Qs is a substring search over
    # names and descriptions, so it reports unrelated packages as already installed
    # and skips the install.
    if pacman -Q $PACKAGE >/dev/null 2>&1
        success-message "$PACKAGE already installed"
    else
        information-message "installing $PACKAGE"

        sudo pacman -S --needed --noconfirm $PACKAGE
    end
end
