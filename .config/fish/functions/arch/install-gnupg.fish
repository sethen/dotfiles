#!/usr/bin/env fish

function install-gnupg
  running-message "install-gnupg"

  yay-install-package gnupg
end
