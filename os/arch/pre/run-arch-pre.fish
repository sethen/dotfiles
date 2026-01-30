#!/usr/bin/env fish

function run-arch-pre
  running-message "run-arch-pre"

  # update & upgrade
  if test "$RUN_DOTFILES_UPDATE" = "true"
    yay --noconfirm
  else
    information-message "run dotfiles update flag not found, skipping update"
  end

  # prep
  copy-fonts

  # install
  #-> git
  install-yay
  #-> pacman
  install-base-devel
  install-base
  install-cmake
  install-efibootmgr
  install-git
  install-linux-firmware
  install-linux
  install-sudo
end
