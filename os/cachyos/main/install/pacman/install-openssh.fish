#!/usr/bin/env fish

function install-openssh
    running-message install-openssh

    yay-queue-package openssh
end
