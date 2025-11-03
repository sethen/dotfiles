#!/bin/fish

function install-ca-certificates
  running-message "install-ca-certificates"

  sudo-apt-install-package ca-certificates
end
