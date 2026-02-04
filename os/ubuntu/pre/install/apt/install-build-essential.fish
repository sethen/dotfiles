#!/usr/bin/env fish

function install-build-essential
    running-message install-build-essential

    sudo-apt-install-package build-essential
end
