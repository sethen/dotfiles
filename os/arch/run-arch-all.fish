#!/usr/bin/env fish

function run-arch-all
  running-message "run-arch-all"

  # setup
  run-arch-install-pacman-packages
  run-common-setup

  run-common-all

  confirm-reboot-system
end

end
