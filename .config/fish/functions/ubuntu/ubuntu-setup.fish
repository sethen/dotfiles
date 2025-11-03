#!/usr/bin/fish

function ubuntu-setup
  switch-shell-to-fish
  make-developer-directory
  add-user-to-docker-group
  copy-fonts
  symlink-git-config-files
  make-config-directory

  # symlink config directories
  symlink-ghostty-config-directory
  symlink-neovim-config-directory
  symlink-starship-config-directory

  install-fisher
end
