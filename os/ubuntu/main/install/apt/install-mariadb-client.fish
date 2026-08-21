#!/usr/bin/env fish

function install-mariadb-client
    running-message install-mariadb-client

    sudo-apt-install-package mariadb-client
end
