#!/usr/bin/env fish

function install-all-brew-packages
  running-message "install-all-brew-packages"

  # dependencies
  install-cmake

  # packages
  install-bob
  install-brave-browser
  install-dotnet
  install-fd
  install-ghostty
  install-gh
  install-git
  install-go
  install-ruby
  install-git
  install-ghostty
  install-fortune
  install-lazydocker
  install-lazygit
  install-nginx
  install-ripgrep
  install-rust
  install-spotify
  install-starship
  install-tmux
  install-virtualbox
end
