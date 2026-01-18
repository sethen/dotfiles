#!/usr/bin/env fish

function run-darwin-all
  running-message "run-darwin-all"

  run-darwin-setup

  run-darwin-brew-packages
  run-common-asdf-packages
  run-common-git-packages

  run-common-golang-packages
  run-common-node-packages
  run-common-rust-packages

  confirm-reboot-system
end
