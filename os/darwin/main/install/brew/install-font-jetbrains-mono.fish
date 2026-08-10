#!/usr/bin/env fish

function install-font-jetbrains-mono
    running-message install-font-jetbrains-mono

    # the unpatched face, which wezterm needs as its primary font so the nerd font
    # ranges fall through to SethensSuperCode. see wezterm/lua/appearance.lua.
    brew-cask-install-package font-jetbrains-mono
end
