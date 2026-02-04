#!/usr/bin/env fish

function install-sudo
    running-message install-sudo

    pacman-install-package sudo
end
