#!/bin/fish

function install-all-golang-packages
  running-message "install-all-golang-packages"

  install-go
  install-lazydocker
  install-lazygit
end
