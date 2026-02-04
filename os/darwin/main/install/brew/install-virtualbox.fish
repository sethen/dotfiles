#!/usr/bin/env fish

function install-virtualbox
    running-message install-virtualbox

    brew-cask-install-package virtualbox
end
