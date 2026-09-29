#!/usr/bin/env fish

function yay-queue-package
    running-message yay-queue-package

    set -l PACKAGE $argv[1]

    # every pacman transaction on cachyos takes a snapper pre and post snapshot
    # and waits on limine-snapper-sync, so one transaction per package means two
    # snapshots per package. queue here and let yay-install-queued-packages
    # install the lot in one transaction.
    #
    # `pacman -Q` matches the package name exactly. -Qs is a substring search over
    # names and descriptions, so it reports unrelated packages as already installed
    # and skips the install.
    if pacman -Q $PACKAGE >/dev/null 2>&1
        success-message "$PACKAGE already installed"
    else if contains -- $PACKAGE $DOTFILES_YAY_QUEUE
        success-message "$PACKAGE already queued"
    else
        information-message "queueing $PACKAGE"

        set -ga DOTFILES_YAY_QUEUE $PACKAGE
    end
end
