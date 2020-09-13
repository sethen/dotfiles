#!/bin/zsh

if ! type rustc > /dev/null; then
	information_message 'installing rust'

	curl https://sh.rustup.rs -sSf | sh

	$CARGO_BIN_DIRECTORY/rustup component add rls rust-analysis rust-docs rust-src
else
	success_message 'rust already installed'
fi
