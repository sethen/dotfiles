#!/usr/bin/env fish

function run-darwin-all
  running-message "run-darwin-all"

  # main
  run-common-main
  run-darwin-main

  confirm-reboot-system
end
