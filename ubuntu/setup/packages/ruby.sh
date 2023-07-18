#!/bin/zsh

if (( $+commands[ruby] )); then
    success-message 'ruby installed'
else
    information-message 'installing ruby'

    ruby-install ruby $RUBY_VERSION
    source $CHRUBY_SHELL_FILE
    chruby $RUBY_VERSION
fi
