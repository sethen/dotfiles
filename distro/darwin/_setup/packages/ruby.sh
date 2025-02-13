#!/bin/zsh

brew-install-if-package-not-exists chruby
brew-install-if-package-not-exists ruby-install

if [[ $(ruby -v) =~ $RUBY_VERSION ]]; then
    success-message 'ruby installed'
else
    information-message 'installing ruby'

    ruby-install $RUBY_VERSION

    # set ruby
    information-message 'setting ruby version'

    . $CHRUBY_SHELL_FILE
    chruby $RUBY_VERSION
fi

if (( $+commands[solargraph] )); then
    success-message 'solargraph installed'
else
    information-message 'installing solargraph'

    gem install solargraph
fi
