#!/usr/bin/fish

function run-ubuntu-all
  running-message "run-ubuntu-all"

  # init
  run-ubuntu-init

  # setup
  run-common-setup
  run-ubuntu-setup

  confirm-reboot-system
end
