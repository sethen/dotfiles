#!/usr/bin/env fish

function install-linux
  running-message "install-linux"

  pacman-install-package linux
end
