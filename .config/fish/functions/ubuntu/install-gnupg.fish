#!/usr/bin/env fish

function install-gnupg
  running-message "install-gnupg"

  sudo-apt-install-package gnupg
end
