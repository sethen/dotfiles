#!/bin/zsh

echo ''
header-message 'os setup'
echo ''

information-message 'cloning repositories'

check-if-file-exists-executable $PRESENT_WORKING_DIRECTORY/os/_setup/repositories/sethen.sh
