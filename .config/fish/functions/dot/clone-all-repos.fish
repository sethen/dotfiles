#!/bin/fish

function clone-all-repos
  running-message "clone-all-repos"

  clone-colloid-icon-theme-repo
  clone-dotfiles-repo
  clone-wallpapers-repo
end
