#!/bin/zsh

if ! type rustc > /dev/null; then
	information_message 'installing rust'

	curl https://sh.rustup.rs -sSf | sh

	$HOME_CARGO_BIN/rustup component add rust-src
	$HOME_CARGO_BIN/rustup component add rust-docs
else
	success_message 'rust already installed'
fi
