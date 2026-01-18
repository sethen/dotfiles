#!/usr/bin/env fish

function run-common-install-git-packages
  running-message "run-common-git-packages"

  clone-dotfiles-repo
  clone-wallpapers-repo
end
