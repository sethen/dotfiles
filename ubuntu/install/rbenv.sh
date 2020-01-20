#!/bin/zsh

if [[ ! -d $HOME_RBENV ]]; then
	information_message 'installing rbenv'

	git clone https://github.com/rbenv/rbenv.git $HOME_RBENV
else
	success_message 'rbenv already installed'
fi

if [[ ! -d $HOME_RBENV_PLUGINS ]]; then
	information_message 'installing rbenv install plugin'

	mkdir -p $HOME_RBENV_PLUGINS
	git clone https://github.com/rbenv/ruby-build.git $HOME_RBENV_PLUGINS/ruby-build
else
	success_message 'rbenv install plugin already installed'
fi

if [[ ! -d $HOME_RBENV_VERSION_BIN ]]; then
	information_message "installing and setting rbenv ruby version $RUBY_VERSION"

	apt_get_install_if_package_not_exists 'libreadline-dev'
	apt_get_install_if_package_not_exists 'libssl-dev'
	apt_get_install_if_package_not_exists 'zlib1g-dev'

	$HOME_RBENV_BIN/rbenv install $RUBY_VERSION
	$HOME_RBENV_BIN/rbenv global $RUBY_VERSION
else
	success_message "rbenv ruby $RUBY_VERSION already installed"
fi
