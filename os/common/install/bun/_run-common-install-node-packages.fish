#!/usr/bin/env fish

function run-common-install-bun-packages
  running-message "run-common-install-bun-packages"

  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server
end
