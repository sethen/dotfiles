#!/bin/zsh

header_message 'os preferences'

if [[ ! -d $DEVELOPER_DIRECTORY/wallpapers ]]; then
    information_message 'cloning wallpapers repo'

    git clone git@github.com:sethen/wallpapers.git $DEVELOPER_DIRECTORY/wallpapers
else
    success_message 'wallpapers repo already cloned'
fi
