#!/usr/bin/env fish

function install-typescript-language-server
  running-message "install-typescript-language-server"

  brew-install-package typescript-language-server
end
