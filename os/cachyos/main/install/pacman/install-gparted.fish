#!/usr/bin/env fish

function install-gparted
    running-message install-gparted

    yay-queue-package gparted
end
