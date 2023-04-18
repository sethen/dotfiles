#!/bin/zsh

if (( $+commands[gopls] )); then
	success_message 'gopls installed'
else
	if [[ -f /usr/local/go/bin/go ]]; then
		information_message 'installing gopls'

		/usr/local/go/bin/go install golang.org/x/tools/gopls@latest
	else
		error_message 'golang binary not found'
	fi
fi
