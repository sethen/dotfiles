#!/usr/bin/env fish

function install-openssh
  running-message "install-openssh"

  yay-install-package openssh
end
