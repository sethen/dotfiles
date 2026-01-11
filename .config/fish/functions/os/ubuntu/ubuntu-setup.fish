#!/usr/bin/fish

function ubuntu-setup
  switch-shell-to-fish

  add-user-to-docker-group
  copy-fonts
  make-developer-directory

  # symlink config directories
  symlink-asdf-config-files
  symlink-ghostty-config-directory
  symlink-git-config-files
  symlink-neovim-config-directory
  symlink-starship-config-directory
end
