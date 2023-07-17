#!/bin/zsh

if (( $+commands[volta] )); then
    success_message 'volta installed'
else
    information_message 'installing volta'

    curl https://get.volta.sh | bash -s -- --skip-setup

    information_message 'installing latest node'

    $VOLTA_BIN_DIRECTORY/volta install node
fi

