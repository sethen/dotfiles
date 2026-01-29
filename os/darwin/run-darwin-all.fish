#!/usr/bin/env fish

function run-darwin-all
  running-message "run-darwin-all"

  # common
  run-common-all

  # darwin
  run-darwin-init
  run-darwin-setup

  confirm-reboot-system
end
