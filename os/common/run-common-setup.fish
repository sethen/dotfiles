#!/usr/bin/env fish

function run-common-setup
  running-message "run-common-setup"

  switch-shell-to-fish
  add-user-to-docker-group 
  make-developer-directory
  make-config-directory
  symlink-asdf-config-files
  symlink-ghostty-config-directory
  symlink-git-config-files
  symlink-neovim-config-directory
  symlink-starship-config-directory
end
