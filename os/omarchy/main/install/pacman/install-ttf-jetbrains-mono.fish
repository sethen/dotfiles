#!/usr/bin/env fish

function install-ttf-jetbrains-mono
    running-message install-ttf-jetbrains-mono

    # the unpatched face. wezterm needs it as the primary font so the nerd font
    # ranges fall through to SethensSuperCode. see wezterm/lua/appearance.lua.
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
