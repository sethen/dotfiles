#!/bin/fish

function install-all-apt-packages
  running-message "install-all-apt-packages"

  # dependencies
  install-ca-certificates
  install-cmake
  install-gnupg

  # packages
  install-brave-browser
  install-docker
  install-dotnet
  install-font-manager
  install-gh
  install-ghostty
  install-git
  install-gparted
  install-gpick
  install-fortune-mod
  install-lazygit
  install-mdadm
  install-nginx
  install-ripgrep
  install-signal
  install-starship
  install-tmux
  install-virtualbox
  install-vlc
end
