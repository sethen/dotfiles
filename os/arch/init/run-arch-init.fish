#!/usr/bin/env fish

function run-arch-init
  running-message "run-arch-init"

  update-and-upgrade-all-yay-packages

  # install packages
  run-arch-init-install
end
