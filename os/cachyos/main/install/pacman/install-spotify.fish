#!/usr/bin/env fish

function install-spotify
    running-message install-spotify

    # spotify-launcher is the official-repo package: a small client that pulls
    # and updates the real spotify build from spotify's own apt repo. the AUR
    # `spotify` package needs its signing key imported by hand, and this keeps
    # itself current, which the snap and brew cask on the other platforms do too
    yay-install-package spotify-launcher
end
