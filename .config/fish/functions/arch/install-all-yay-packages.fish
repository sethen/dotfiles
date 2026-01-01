#!/usr/bin/env fish

function install-all-yay-packages
  running-message "install-all-yay-packages"

  # dependencies
  install-base-devel

  # packages
  install-spotify
  install-starship
  install-dotnet-sdk
  install-fd
  install-font-manager
  install-gh
  install-ghostty
  install-git
  install-gparted
  install-gpick
  install-fortune-mod
  install-mdadm
  install-nginx
  install-postgresql
  install-ripgrep
  install-signal-desktop
  install-starship
  install-tmux
  install-virtualbox
  install-vlc
end
