#!/usr/bin/env fish

function install-mdadm
    running-message install-mdadm

    yay-queue-package mdadm
end
