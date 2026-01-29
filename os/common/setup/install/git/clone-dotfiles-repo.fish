#!/usr/bin/env fish

function clone-dotfiles-repo
  running-message "install-dotfiles-repo"

  if not test -d $DEVELOPER_DIRECTORY/dotfiles
    information-message "cloning dotfiles repo"

    git clone git@github.com:sethen/dotfiles.git $DEVELOPER_DIRECTORY/wallpapers
  else
    success-message "dotfiles repo already cloned"
  end
end
