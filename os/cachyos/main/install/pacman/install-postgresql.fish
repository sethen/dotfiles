#!/usr/bin/env fish

function install-postgresql
    running-message install-postgresql

    yay-queue-package postgresql
end
