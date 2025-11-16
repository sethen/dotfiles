#!/usr/bin/env fish

function darwin-setup
  switch-shell-to-fish
  touch-hushlogin
  make-developer-directory
  copy-fonts
  symlink-git-config-files
  make-config-directory

  # symlink config directories
  symlink-ghostty-config-directory
  symlink-neovim-config-directory
  symlink-starship-config-directory

  install-fisher
end
