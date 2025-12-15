#!/usr/bin/env fish

function install-libgmp
  running-message "install-libgmp"

  sudo-apt-install-package libgmp-dev
end
