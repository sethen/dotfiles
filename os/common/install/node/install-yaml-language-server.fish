#!/usr/bin/env fish

function install-yaml-language-server
  running-message "install-yaml-language-server"

  if type -q yaml-language-server
    success-message 'yaml-language-server installed'
  else
    information-message 'installing yaml-language-server'

    npm install -g yaml-language-server
  end
end
