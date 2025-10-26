#!/bin/fish

function install-virtualbox
  running-message "install-virtualbox"

  sudo-apt-install-package virtualbox
end
