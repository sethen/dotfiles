#!/bin/fish

function install-golang
  running-message "install-golang"

  sudo-apt-install-package golang-go
end
