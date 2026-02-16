#!/usr/bin/env fish

function install-ca-certificates
    running-message install-ca-certificates

    yay-install-package ca-certificates
end
