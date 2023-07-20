#!/bin/zsh

RUBY_GEM_BIN=~/.rubies/ruby-$RUBY_VERSION/bin/gem
SOLARGRAPH=~/.rubies/ruby-$RUBY_VERSION/bin/solargraph

if (( $+commands[solargraph] )); then
    success-message 'solargraph installed'
else
    if [[ -f $RUBY_GEM_BIN ]]; then
	information-message 'installing solargraph'

	$RUBY_GEM_BIN install solargraph
    else
	error-message 'ruby not installed'
    fi
fi
