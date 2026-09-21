#!/usr/bin/env fish

function install-ttf-jetbrains-mono
    running-message install-ttf-jetbrains-mono

    # the unpatched face. kitty uses it as the primary font and routes the nerd
    # font ranges with symbol_map instead. see kitty/kitty.conf.
    #
    # this does not go through pacman-install-package: that helper tests with
    # `pacman -Qs`, which is a substring search, so the already-installed
    # ttf-jetbrains-mono-nerd matches and the install gets skipped. `pacman -Q`
    # matches the package name exactly.
    if pacman -Q ttf-jetbrains-mono >/dev/null 2>&1
        success-message "ttf-jetbrains-mono already installed"
    else
        information-message "installing ttf-jetbrains-mono"

        sudo pacman -S --needed --noconfirm ttf-jetbrains-mono
    end
end
