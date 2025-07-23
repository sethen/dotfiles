#!/bin/zsh

echo ''
header-message "$DISTRO finalize"
echo ''

if [[ -d $DEVELOPER_DIRECTORY/dotfiles ]]; then
  success-message 'dotfiles already in developer directory'
else
  information-message 'cloning dotfiles into developer directory'

  cd $DEVELOPER_DIRECTORY
  git clone git@github.com:sethen/dotfiles.git
fi

# reboot system prompt
$PRESENT_WORKING_DIRECTORY/lib/reboot-system-prompt.sh
