#!/usr/bin/env fish

function install-all-node-packages
  running-message "install-all-node-packages"

  # dependencies
  install-gnupg

  # node
  install-node

  # npm modules
  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server
end
