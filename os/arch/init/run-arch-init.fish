#!/usr/bin/env fish

function run-arch-init
  running-message "run-arch-init"

  yay --noconfirm

  # prep
  copy-fonts

  # install

  ## git
  install-yay

  ## pacman
  install-base-devel
  install-base
  install-cmake
  install-efibootmgr
  install-git
  install-linux-firmware
  install-linux
  install-sudo
end
