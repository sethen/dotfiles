#!/usr/bin/env fish

function install-tmux
  running-message "install-tmux"

  if asdf which tmux >/dev/null 2>&1
    success-message "tmux already installed"
  else
    asdf plugin add tmux
    asdf install tmux 3.6
    asdf set -u tmux 3.6
  end
end
