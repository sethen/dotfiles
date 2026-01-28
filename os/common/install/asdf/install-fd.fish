#!/usr/bin/env fish

function install-fd
  running-message "install-fd"

  if type -s fd >/dev/null
    success-message "fd already installed"
  else
    asdf plugin add fd
    asdf install fd latest
    asdf set -u fd latest
  end
end
