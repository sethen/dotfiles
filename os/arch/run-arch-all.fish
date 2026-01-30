#!/usr/bin/env fish

function run-arch-all
  running-message "run-arch-all"

  # main
  run-common-main
  run-arch-main

  confirm-reboot-system
end
