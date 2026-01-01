#!/usr/bin/env fish

function install-starship
  running-message "install-starship"

  if type -q starship
    success-message "starship already installed"
  else
    information-message "installing starship"


    yay-install-package starship
  end
end
