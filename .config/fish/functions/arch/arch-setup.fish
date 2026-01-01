#!/usr/bin/fish

function arch-setup
  switch-shell-to-fish
  add-user-to-docker-group

  # copying
  copy-fonts

  # directory creation
  make-developer-directory

  # symlink config directories
  symlink-asdf-config-files
  symlink-ghostty-config-directory
  symlink-git-config-files
  symlink-neovim-config-directory
  symlink-starship-config-directory

  install-fisher
end
