#!/usr/bin/env fish

function run-arch-all
  running-message "run-arch-all"

  # common
  run-common-all

  # arch
  run-arch-init
  run-arch-setup

  confirm-reboot-system
end
