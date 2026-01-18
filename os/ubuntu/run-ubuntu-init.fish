#!/usr/bin/fish

function run-ubuntu-init
  running-message "run-ubuntu-init"

  update-and-upgrade-all-apt-packages
  run-ubuntu-install-init-apt-packages
end
