#!/usr/bin/env fish

function install-all-node-packages
  running-message "install-all-node-packages"

  install-nvm
  install-node
  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server
end
