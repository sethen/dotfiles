#!/usr/bin/env fish

function install-font-jetbrains-mono
    running-message install-font-jetbrains-mono

    # the unpatched face, which kitty uses as its primary font so the nerd font
    # ranges resolve through symbol_map instead. see kitty/kitty.conf.
    brew-cask-install-package font-jetbrains-mono
end
