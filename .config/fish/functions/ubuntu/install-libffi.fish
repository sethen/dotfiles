#!/usr/bin/env fish

function install-libffi
  running-message "install-libffi"

  sudo-apt-install-package libffi-dev
end
