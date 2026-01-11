#!/usr/bin/fish

function ubuntu-init
  running-message "ubuntu-init"

  # update and upgrade dependencies
  update-and-upgrade-all-apt-packages

  # install homebrew
  install-homebrew

  # install dependencies
  install-autoconf
  install-build-essential
  install-curl
  install-fzf
  install-gh
end
