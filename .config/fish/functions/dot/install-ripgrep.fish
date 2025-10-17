#!/bin/fish

function install-ripgrep
  running-message "install-ripgrep"

  sudo-apt-install-package ripgrep
end
