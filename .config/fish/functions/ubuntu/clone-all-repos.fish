#!/usr/bin/env fish

function clone-all-repos
  running-message "clone-all-repos"

  clone-white-sur-icon-theme-repo
  clone-dotfiles-repo
  clone-wallpapers-repo
end
