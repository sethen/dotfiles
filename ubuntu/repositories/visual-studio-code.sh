#!/bin/zsh

if ! type code > /dev/null; then
	information_message 'adding visual-studio-code key'

	wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

	information_message 'adding visual-studio-code repository'

	sudo sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list"
else
	success_message 'visual-studio-code key and repository already added'
fi
