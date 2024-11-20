#!/bin/zsh

if [[ ! -d $DEVELOPER_DIRECTORY/wallpapers ]]; then
    information-message 'cloning wallpapers'

    git clone git@github.com:sethen/wallpapers.git $DEVELOPER_DIRECTORY/wallpapers
else
    success-message 'wallpapers already cloned'
fi
