#!/usr/bin/env fish

function sudo-apt-install-package
  running-message "sudo-apt-install-package"

  set PACKAGE $argv[1]

  if not dpkg --get-selections | awk '{print $1}' | grep -w $PACKAGE > /dev/null
    information-message "installing $PACKAGE"

    sudo apt-get install $PACKAGE -y
  else
    success-message "$PACKAGE already installed"
  end
end
