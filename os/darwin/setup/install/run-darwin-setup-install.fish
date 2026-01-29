#!/usr/bin/env fish

function run-darwin-setup-install
  running-message "run-darwin-setup-install"

  # dependencies
  install-cmake

  # install homebrew
  install-homebrew

  # brew
  install-brave-browser
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
