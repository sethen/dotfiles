#!/bin/zsh

if [[ ! -d $RBENV_DIRECTORY ]]; then
	information_message 'installing rbenv'

	git clone https://github.com/rbenv/rbenv.git $RBENV_DIRECTORY
else
	success_message 'rbenv already installed'
fi

if [[ ! -d $RBENV_PLUGINS_DIRECTORY ]]; then
	information_message 'installing rbenv install plugin'

	mkdir -p $RBENV_PLUGINS_DIRECTORY
	git clone https://github.com/rbenv/ruby-build.git $RBENV_PLUGINS_DIRECTORY/ruby-build
else
	success_message 'rbenv install plugin already installed'
fi

if [[ ! -d $RBENV_VERSION_BIN_DIRECTORY ]]; then
	information_message "installing and setting rbenv ruby version $RUBY_VERSION"

	apt_get_install_if_package_not_exists 'libreadline-dev'
	apt_get_install_if_package_not_exists 'libssl-dev'
	apt_get_install_if_package_not_exists 'zlib1g-dev'

	$RBENV_BIN_DIRECTORY/rbenv install $RUBY_VERSION
	$RBENV_BIN_DIRECTORY/rbenv global $RUBY_VERSION
else
	success_message "rbenv ruby $RUBY_VERSION already installed"
fi
