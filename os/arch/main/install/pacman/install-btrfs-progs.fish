#!/usr/bin/env fish

function install-btrfs-progs
    running-message install-btrfs-progs

    yay-install-package btrfs-progs
end
