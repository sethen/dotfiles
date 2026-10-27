#!/usr/bin/env fish

function install-ttf-jetbrains-mono
    running-message install-ttf-jetbrains-mono

    # the unpatched face. kitty uses it as the primary font and routes the nerd
    # font ranges with symbol_map instead. see kitty/kitty.conf.
    yay-queue-package ttf-jetbrains-mono

    # what that symbol_map routes to. without it kitty falls back to whatever
    # fontconfig finds, and icons render as boxes or the wrong glyph
    yay-queue-package ttf-jetbrains-mono-nerd
end
