#!/usr/bin/env fish

function install-node
  running-message "install-node"

  if type -q node
    success-message 'node already installed'
  else
    information-message 'installing node'

    nvm install latest
  end
end
