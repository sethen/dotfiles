#!/usr/bin/env fish

function install-node
  running-message "install-node"

  if command -s node > /dev/null
    success-message "node already installed"
  else
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs lts
    asdf set nodejs lts
  end
end
