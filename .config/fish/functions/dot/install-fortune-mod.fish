#!/bin/fish

function install-fortune-mod
  running-message "install-fortune-mod"

  sudo-apt-install-package fortune-mod
end
