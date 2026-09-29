#!/usr/bin/env fish

function install-mariadb-clients
    running-message install-mariadb-clients

    yay-queue-package mariadb-clients
end
