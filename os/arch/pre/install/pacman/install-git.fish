#!/usr/bin/env fish

function install-git
  running-message "install-git"

  pacman-install-package git
end
