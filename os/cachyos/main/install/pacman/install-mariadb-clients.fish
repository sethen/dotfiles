#!/usr/bin/env fish

function install-mariadb-clients
    running-message install-mariadb-clients

    yay-install-package mariadb-clients
end
