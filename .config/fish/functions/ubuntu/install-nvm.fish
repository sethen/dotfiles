#!/usr/bin/env fish

function install-nvm
  running-message "install-nvm"

  if type -q nvm
    success-message 'nvm already installed'
  else
    information-message 'installing nvm'

    fisher install jorgebucaran/nvm.fish
  end
end
