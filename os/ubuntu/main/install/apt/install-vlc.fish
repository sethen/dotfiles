#!/usr/bin/env fish

function install-vlc
    running-message install-vlc

    sudo-apt-install-package vlc
end
