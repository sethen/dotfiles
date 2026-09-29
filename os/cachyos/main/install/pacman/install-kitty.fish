#!/usr/bin/env fish

function install-kitty
    running-message install-kitty

    # the repo package, not the AUR: it is current (upstream tags often and
    # Arch tracks it) and ships the terminfo, the desktop entry, the icon and
    # the `kitty @` remote control this setup depends on. cachyos ships kitty
    # preinstalled as its default terminal, so this is usually a no-op.
    #
    # not a mise tool: kitty is a GUI application with an OpenGL renderer and a
    # desktop entry, none of which mise's backends install.
    pacman-install-package kitty
end
