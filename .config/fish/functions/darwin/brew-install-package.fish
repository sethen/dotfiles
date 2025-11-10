#!/usr/bin/env fish

function brew-install-package
  running-message "brew-install-package"

  set PACKAGE $argv[1]

  if not brew list --formula | grep -w $PACKAGE > /dev/null
    information-message "installing $PACKAGE"

    brew install $PACKAGE
  else
    success-message "$PACKAGE already installed"
  end
end
