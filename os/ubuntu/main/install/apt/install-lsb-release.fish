#!/usr/bin/env fish

function install-lsb-release
    running-message install-lsb-release

    sudo-apt-install-package lsb-release
end
