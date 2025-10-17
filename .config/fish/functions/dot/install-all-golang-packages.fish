#!/bin/fish

function install-all-golang-packages
  running-message "install-all-golang-packages"

  install-golang
  install-lazydocker
end
