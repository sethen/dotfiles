#!/usr/bin/env fish

function install-gparted
    running-message install-gparted

    sudo-apt-install-package gparted
end
