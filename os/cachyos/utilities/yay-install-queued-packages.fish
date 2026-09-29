#!/usr/bin/env fish

function yay-install-queued-packages
    running-message yay-install-queued-packages

    if test (count $DOTFILES_YAY_QUEUE) -eq 0
        success-message "no queued packages to install"

        return
    end

    information-message "installing $DOTFILES_YAY_QUEUE"

    # one transaction, so one snapshot pair. the tradeoff is all or nothing: a
    # package that fails to resolve aborts the whole transaction, and nothing in
    # the queue is installed until it is fixed.
    set -l PACKAGES $DOTFILES_YAY_QUEUE
    set -g DOTFILES_YAY_QUEUE

    if not yay -S --needed --noconfirm $PACKAGES
        error-message "yay failed to install the queued packages: $PACKAGES"

        return 1
    end
end
