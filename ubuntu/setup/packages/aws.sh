#!/bin/zsh
if typeset -f aws > /dev/null; then
	information_message "installing aws"

	AWS_ZIP=awscliv2.zip

	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o $AWS_ZIP
	unzip $AWS_ZIP
	sudo ./aws/install
	rm -rf $AWS_ZIP
else
	success_message 'aws already installed'
fi
