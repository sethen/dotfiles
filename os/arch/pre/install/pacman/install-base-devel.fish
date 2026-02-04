#!/usr/bin/env fish

function install-base-devel
    running-message install-base-devel

    pacman-install-package base-devel
end
