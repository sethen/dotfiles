#!/bin/zsh

if [[ ! -d $OPT_RUBIES_DIRECTORY ]]; then
	information_message "installing ruby-$RUBY_VERSION"

	wget -O ~/$RUBY_DIRECTORY.tar.xz https://cache.ruby-lang.org/pub/ruby/3.1/$RUBY_DIRECTORY.tar.xz
	tar -xJvf ~/$RUBY_DIRECTORY.tar.xz -C ~

	cd ~/$RUBY_DIRECTORY
	./configure --prefix=$OPT_RUBIES_DIRECTORY
	make
	sudo make install

	rm -rf ~/$RUBY_DIRECTORY
	rm -rf ~/$RUBY_DIRECTORY.tar.xz
else
	success_message "ruby-$RUBY_VERSION is already installed"
fi
