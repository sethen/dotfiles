#!/usr/bin/env fish

function run-arch-all
  running-message "run-arch-all"

  # init
  run-common-init

  # setup
  run-common-setup
  run-arch-install-pacman-packages

  # all
  run-common-all

  confirm-reboot-system
end

end
