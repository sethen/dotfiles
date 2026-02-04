#!/usr/bin/env fish

function install-curl
    running-message install-curl

    sudo-apt-install-package curl
end
