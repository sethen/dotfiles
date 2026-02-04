#!/usr/bin/env fish

function install-mdadm
    running-message install-mdadm

    sudo-apt-install-package mdadm
end
