#!/bin/zsh

if ! type "rustc" > /dev/null; then
	information_message "installing rust"

	curl https://sh.rustup.rs -sSf | sh

	rustup component add rust-src
	rustup component add rust-docs
else
	success_message "rust already installed"
fi
