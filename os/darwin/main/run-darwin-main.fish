#!/usr/bin/env fish

function run-darwin-setup
  running-message "run-darwin-setup"

  ## install
  #-> homebrew
  install-homebrew
  #-> brew
  install-brave-browser
  install-cmake
  install-fish-lsp
  install-ghostty
  install-gh
  install-git
  install-ghostty
  install-fortune
  install-mysql
  install-nginx
  install-spotify
  install-virtualbox
  install-virtualenv
end
