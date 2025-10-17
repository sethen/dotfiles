#!/bin/fish

function install-bash-language-server
  running-message "install-bash-language-server"

  if type -q bash-language-server
    success-message "bash-language-server installed"
  else
    information-message "installing bash-language-server"

    npm install -g bash-language-server
  end
end
