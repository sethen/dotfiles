#!/usr/bin/env fish

function pacman-install-package
  running-message "pacman-install-package"

  set -l PACKAGE $argv[1]

  if not pacman -Qs $PACKAGE >/dev/null
    information-message "installing $PACKAGE"

    sudo pacman -S --needed --noconfirm $PACKAGE
  else
    success-message "$PACKAGE already installed"
  end
end
