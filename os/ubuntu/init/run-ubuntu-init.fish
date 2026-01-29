#!/usr/bin/env fish

function run-ubuntu-init
  running-message "run-ubuntu-init"

  update-and-upgrade-all-apt-packages

  # install
  run-ubuntu-install-init
end
