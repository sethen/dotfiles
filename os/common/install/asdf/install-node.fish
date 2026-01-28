#!/usr/bin/env fish

function install-node
  running-message "install-node"

  if asdf which node >/dev/null 2>&1
    success-message "node already installed"
  else
    asdf plugin add nodejs
    asdf install nodejs lts
    asdf set -u nodejs lts
  end
end
