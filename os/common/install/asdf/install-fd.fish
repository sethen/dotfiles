#!/usr/bin/env fish

function install-fd
  running-message "install-fd"

  if type -s go >/dev/null
    success-message "fd already installed"
  else
    asdf plugin add fd
    asdf install fd 10.3.0
    asdf set -u fd 10.3.0
  end
end
