#!/bin/zsh

if ! type tmux > /dev/null; then
	information_message 'installing tmux'

	TMUX=/usr/bin/tmux

	sudo wget -O $TMUX https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}a/tmux-${TMUX_VERSION}a-x86_64.AppImage
	sudo chmod +x $TMUX
else
	success_message 'tmux already installed'
fi
