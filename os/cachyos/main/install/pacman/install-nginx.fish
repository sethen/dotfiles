#!/usr/bin/env fish

function install-nginx
    running-message install-nginx

    yay-queue-package nginx
end
