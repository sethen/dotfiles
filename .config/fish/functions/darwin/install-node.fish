#!/usr/bin/env fish

function install-node
  running-message "install-node"

  if string length (asdf list nodejs) > 0
    success-message "node already installed"
  else
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs lts
    asdf set nodejs lts
  end
end
