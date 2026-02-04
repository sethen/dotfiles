#!/usr/bin/env fish

function install-linux-firmware
    running-message install-linux-firmware

    pacman-install-package linux-firmware
end
