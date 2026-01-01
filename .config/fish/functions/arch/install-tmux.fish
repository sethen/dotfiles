#!/usr/bin/env fish

function install-tmux
  running-message "install-tmux"

  yay-install-package tmux
end
