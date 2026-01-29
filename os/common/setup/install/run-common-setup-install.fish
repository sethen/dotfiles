#!/usr/bin/env fish

function run-common-setup-install
  running-message "run-common-setup-install"

  # bun
  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server

  # curl
  install-mise

  # git
  clone-dotfiles-repo
  clone-wallpapers-repo

  # mise
  mise install
  mise env fish | source
end
