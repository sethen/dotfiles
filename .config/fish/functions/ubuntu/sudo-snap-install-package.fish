#!/usr/bin/env fish

function sudo-snap-install-package
  running-message "sudo-snap-install-package"

  if not snap list | grep -w $argv[1] > /dev/null
    information-message "installing $argv[1]"

    sudo snap install $argv[1]
  else
    success-message "$argv[1] already installed"
  end
end
