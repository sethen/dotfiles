#!/usr/bin/env fish

function install-fonts-jetbrains-mono
    running-message install-fonts-jetbrains-mono

    # the unpatched face, which wezterm needs as its primary font so the nerd font
    # ranges fall through to SethensSuperCode. see wezterm/lua/appearance.lua.
    sudo-apt-install-package fonts-jetbrains-mono
end
