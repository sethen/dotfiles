#!/usr/bin/env fish

function install-all-brew-packages
  running-message "install-all-brew-packages"

  # dependencies
  install-cmake

  # install homebrew
  install-homebrew

  # packages
  install-asdf
  install-brave-browser
  install-dotnet
  install-fd
  install-fish-lsp
  install-ghostty
  install-gh
  install-git
  install-ruby
  install-git
  install-ghostty
  install-fortune
  install-lazydocker
  install-lazygit
  install-mysql
  install-nginx
  install-ripgrep
  install-spotify
  install-starship
  install-tmux
  install-virtualbox
  install-virtualenv
end
