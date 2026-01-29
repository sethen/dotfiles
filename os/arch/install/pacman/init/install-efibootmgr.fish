#!/usr/bin/env fish

function install-efibootmgr
  running-message "install-efibootmgr"

  pacman-install-package efibootmgr
end
