#!/usr/bin/env fish

function install-libssl
  running-message "install-libssl"

  sudo-apt-install-package libssl-dev
end
