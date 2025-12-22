#!/usr/bin/env fish

function install-all-apt-packages
  running-message "install-all-apt-packages"

  # dependencies
  install-ca-certificates
  install-cmake
  install-gnupg

  # packages
  install-brave-browser
  install-dotnet
  install-fd-find
  install-font-manager
  install-gh
  install-ghostty
  install-git
  install-gnome-tweaks
  install-gparted
  install-gpick
  install-fortune-mod
  install-lazygit
  install-mdadm
  install-nginx
  install-postgresql
  install-ripgrep
  install-signal
  install-starship
  install-tmux
  install-virtualbox
  install-vlc
end
