#!/usr/bin/env fish

function run-darwin-all
  running-message "run-darwin-all"

  # init
  run-common-init

  # setup
  run-common-setup
  run-darwin-setup

  # all
  run-common-all
  run-darwin-brew-packages

  confirm-reboot-system
end
