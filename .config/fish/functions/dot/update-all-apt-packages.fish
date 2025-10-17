#!/bin/fish

function update-all-apt-packages
  running-message "update-all-apt-packages"

  sudo apt-get update -y
end
