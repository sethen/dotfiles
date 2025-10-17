#!/bin/fish

function install-git
  running-message "install-git"

  sudo-apt-install-package git
end
