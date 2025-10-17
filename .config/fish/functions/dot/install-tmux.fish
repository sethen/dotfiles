#!/bin/fish

function install-tmux
  running-message "install-tmux"

  sudo-apt-install-package tmux
end
