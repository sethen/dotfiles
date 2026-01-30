#!/usr/bin/env fish

function run-common-main
  running-message "run-common-main"

  # install
  #-> bun
  install-bash-language-server
  install-typescript
  install-typescript-language-server
  install-vscode-langservers-extracted
  install-yaml-language-server
  #-> git
  clone-dotfiles-repo
  clone-wallpapers-repo
end
