#!/usr/bin/fish

function run-arch-init
  running-message "run-arch-init"

  update-and-upgrade-all-yay-packages

  run-arch-install-init-pacman-packages
  run-arch-install-init-git-packages
end
