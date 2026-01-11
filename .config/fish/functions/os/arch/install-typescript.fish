#!/usr/bin/env fish

function install-typescript
  running-message "install-tsc"

  if type -q tsc 
    success-message "tsc installed"
  else
    information-message 'installing tsc'

    npm install -g typescript
  end
end
