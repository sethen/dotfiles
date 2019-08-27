#!/bin/zsh

if [[ ! -d $USER_RBENV ]]; then
	information_message "installing rbenv"

	git clone https://github.com/rbenv/rbenv.git $USER_RBENV
	${USER_RBENV}/bin/rbenv init

	information_message "installing rbenv install plugin"

	mkdir -p ${USER_RBENV}/plugins
	git clone https://github.com/rbenv/ruby-build.git ${USER_RBENV}/plugins/ruby-build

	information_message "installing and setting ruby version ${RUBY_VERSION}"

	source ~/.zshrc

	rbenv install ${RUBY_VERSION}
	rbenv global ${RUBY_VERSION}
else
	success_message "rbenv already installed"
fi
