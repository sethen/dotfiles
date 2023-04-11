#!/bin/zsh

if (( $+commands[rustup] )); then
	success_message 'rust installed'
else
	information_message 'installing rust'

	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
