#!/usr/bin/env fish

function install-kitty
    running-message install-kitty

    brew-cask-install-package kitty
end
