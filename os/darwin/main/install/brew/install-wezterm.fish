#!/usr/bin/env fish

function install-wezterm
    running-message install-wezterm

    brew-cask-install-package wezterm
end
