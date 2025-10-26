#!/bin/fish

function install-font-manager
  running-message "install-font-manager"

  sudo-apt-install-package font-manager
end
