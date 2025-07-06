#!/bin/zsh

if [[ -d $DEVELOPER_DIRECTORY/dotfiles ]]; then
  success-message 'dotfiles already in developer directory'
else
  information-message 'cloning dotfiles into developer directory'

  git clone git@github.com:sethen/dotfiles.git $DEVELOPER_DIRECTORY
fi

# reboot system prompt
$PRESENT_WORKING_DIRECTORY/lib/reboot-system-prompt.sh
