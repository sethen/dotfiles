#!/bin/zsh

if (( $+commands[volta] )); then
    success-message 'volta installed'
else
    information-message 'installing volta'

    curl https://get.volta.sh | bash -s -- --skip-setup

    information-message 'installing latest node'

    $VOLTA_BIN_DIRECTORY/volta install node
fi

