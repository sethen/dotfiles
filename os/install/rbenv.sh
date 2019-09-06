#!/bin/zsh

if [[ ! -d $HOME_RBENV ]]; then
	information_message "installing rbenv"

	git clone https://github.com/rbenv/rbenv.git $HOME_RBENV
	${HOME_RBENV}/bin/rbenv init

	information_message "installing rbenv install plugin"

	mkdir -p ${HOME_RBENV}/plugins
	git clone https://github.com/rbenv/ruby-build.git ${HOME_RBENV}/plugins/ruby-build

	information_message "installing and setting ruby version ${RUBY_VERSION}"

	source ~/.zshrc

	rbenv install ${RUBY_VERSION}
	rbenv global ${RUBY_VERSION}
else
	success_message "rbenv already installed"
fi
