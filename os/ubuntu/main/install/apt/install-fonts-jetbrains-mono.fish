#!/usr/bin/env fish

function install-fonts-jetbrains-mono
    running-message install-fonts-jetbrains-mono

    # the unpatched face, which kitty uses as its primary font so the nerd font
    # ranges resolve through symbol_map instead. see kitty/kitty.conf.
    sudo-apt-install-package fonts-jetbrains-mono
end
