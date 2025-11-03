#!/bin/fish

function install-all-rust-packages
  running-message "install-all-rust-packages"

  install-nvm
  install-node
  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server
end
