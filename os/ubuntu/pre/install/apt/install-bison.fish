#!/usr/bin/env fish

function install-bison
    running-message install-bison

    sudo-apt-install-package bison
end
