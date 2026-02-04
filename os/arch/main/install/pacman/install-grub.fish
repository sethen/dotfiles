#!/usr/bin/env fish

function install-grub
    running-message install-grub

    yay-install-package grub
end
