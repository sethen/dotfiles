#!/usr/bin/env fish

function install-spotify
    running-message install-spotify

    sudo-snap-install-package spotify
end
