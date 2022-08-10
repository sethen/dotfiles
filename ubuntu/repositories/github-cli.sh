#!/bin/zsh

if [[ ! -a $ETC_APT_SOURCES_DIRECTORY/github-cli.list ]]; then
	information_message 'adding github-cli key'

	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

	information_message 'adding github-cli repository'

	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
else
	success_message 'github-cli key and repository already added'
fi
