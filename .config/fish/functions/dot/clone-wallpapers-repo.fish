#!/bin/fish

function clone-wallpapers-repo
  running-message "clone-wallpapers-repo"

  if not test -d $DEVELOPER_DIRECTORY/wallpapers
    information-message 'cloning wallpapers repo'

    git clone git@github.com:sethen/wallpapers.git $DEVELOPER_DIRECTORY/wallpapers
  else
    success-message 'wallpapers repo already cloned'
  end
end
