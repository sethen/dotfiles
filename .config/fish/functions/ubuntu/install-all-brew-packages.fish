#!/usr/bin/env fish

function install-all-brew-packages
  running-message "install-all-brew-packages"

  # install homebrew
  install-homebrew

  # packages
  install-asdf
end
