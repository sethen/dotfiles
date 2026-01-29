#!/usr/bin/env fish

function run-darwin-all
  running-message "run-darwin-all"

  # darwin
  run-darwin-init

  # setup
  run-common-setup
  run-darwin-setup

  confirm-reboot-system
end
