#!/usr/bin/env fish

function run-arch-install-init-pacman-packages
  running-message "run-arch-install-init-pacman-packages"

  install-base-devel
  install-git
end
