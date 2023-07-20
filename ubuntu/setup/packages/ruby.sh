#!/bin/zsh

if (( $+commands[ruby] )); then
    success-message 'ruby installed'
else
    information-message 'installing ruby'

    ruby-install ruby $RUBY_VERSION
fi
