#!/usr/bin/env fish

function run-common-all
  running-message "run-common-all"

  run-common-install-asdf-packages
  run-common-install-git-packages
  run-common-install-golang-packages
  run-common-install-node-packages
  run-common-install-rust-packages
end
