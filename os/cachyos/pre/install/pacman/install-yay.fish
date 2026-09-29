#!/usr/bin/env fish

function install-yay
    running-message install-yay

    # cachyos carries yay in its own repo, so there is no makepkg bootstrap from
    # the AUR. everything after this queues through yay-queue-package.
    pacman-install-package yay
end
