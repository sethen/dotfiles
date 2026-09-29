#!/usr/bin/env fish

function install-brave
    running-message install-brave

    yay-queue-package brave-bin
end
