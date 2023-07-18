#!/bin/zsh

header-message 'os preferences'

if [[ ! -d $DEVELOPER_DIRECTORY/wallpapers ]]; then
    information-message 'cloning wallpapers repo'

    git clone git@github.com:sethen/wallpapers.git $DEVELOPER_DIRECTORY/wallpapers
else
    success-message 'wallpapers repo already cloned'
fi
