#!/usr/bin/env fish

function run-common-install-node-packages
  running-message "run-common-install-node-packages"

  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server
end
