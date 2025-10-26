#!/bin/fish

function make-config-directory
  running-message "make-config-directory"

  if not test -d $HOME_CONFIG_DIRECTORY
    information-message "making config directory"

    mkdir -p $HOME_CONFIG_DIRECTORY
  else
    success-message "config directory already exists"
  end
end
