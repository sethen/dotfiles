#!/usr/bin/env fish

function darwin-setup
  switch-shell-to-fish

  # copying
  copy-fonts

  # directory creation
  make-developer-directory
  copy-fonts
  make-config-directory

  # file creation
  touch-hushlogin

  # symlinks
  symlink-asdf-config-files
  symlink-ghostty-config-directory
  symlink-git-config-files
  symlink-neovim-config-directory
  symlink-starship-config-directory

  # fish support
  install-fisher
end
