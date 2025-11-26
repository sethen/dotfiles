#!/usr/bin/env fish

function install-all-brew-packages
  running-message "install-all-brew-packages"

  # dependencies
  install-cmake

  # packages
  install-asdf
  install-bob
  install-brave-browser
  install-dotnet
  install-fd
  install-fish-lsp
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
  install-mysql
  install-nginx
  install-ripgrep
  install-rust
  install-spotify
  install-starship
  install-tmux
  install-virtualbox
  install-virtualenv
end
