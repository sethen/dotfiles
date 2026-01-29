#!/usr/bin/env fish

function update-and-upgrade-all-apt-packages
  running-message "update-and-upgrade-all-apt-packages"

  sudo apt-get update -y
  sudo apt-get upgrade -y
end
