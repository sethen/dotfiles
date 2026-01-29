#!/usr/bin/env fish

function run-common-setup
  running-message "run-common-setup"

  # bun
  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server

  # git
  clone-dotfiles-repo
  clone-wallpapers-repo
end
