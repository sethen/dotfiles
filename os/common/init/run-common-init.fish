#!/usr/bin/env fish

function run-common-init
  running-message "run-common-init"

  # global
  switch-shell-to-fish

  # prep
  ## files
  make-config-directory
  make-developer-directory
  make-mise-directory
  symlink-fish-config-file
  symlink-fish-functions-directory
  symlink-ghostty-config-directory
  symlink-git-config-files
  symlink-mise-config-files
  symlink-neovim-config-directory
  symlink-starship-config-directory

  ## permissions
  add-user-to-docker-group 

  # install
  install-mise

  # mise
  mise install
  mise env fish | source
end
