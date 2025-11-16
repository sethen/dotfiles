#!/usr/bin/env fish

function install-solargraph
  running-message "install-solargraph"

  if type -q solargraph
    success-message 'solargraph is already installed'
  else
    information-message 'installing solargraph'

    gem install solargraph
  end
end
