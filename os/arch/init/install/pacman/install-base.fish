#!/usr/bin/env fish

function install-base
  running-message "install-base"

  pacman-install-package base
end
