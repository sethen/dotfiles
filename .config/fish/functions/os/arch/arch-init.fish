#!/usr/bin/fish

function arch-init
  running-message "arch-init"

  # update and upgrade
  update-and-upgrade-all-yay-packages

  install-base-devel
  install-curl
  install-gh
end
