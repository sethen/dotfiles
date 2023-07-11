#!/bin/zsh

if (( $+commands[emacs] )); then
	success_message 'emacs installed'
else
	information_message 'installing emacs'

	sudo apt build-dep emacs
	sudo apt install gcc-12 libgccjit0 libgccjit-12-dev -y

	wget -O ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz https://git.savannah.gnu.org/cgit/emacs.git/snapshot/$EMACS_DOWNLOAD_DIRECTORY.tar.gz
	tar -xvf ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz -C ~

	cd ~/$EMACS_DOWNLOAD_DIRECTORY

	CC='gcc-12' ./configure --with-native-compilation=aot \
	  --with-x-toolkit=gtk3 \
	  --with-json \
	  --with-tree-sitter \
      --with-gif \
	  --with-png \
	  --with-jpeg \
	  --with-rsvg \
	  --with-tiff \
      --with-imagemagick \
	  --with-xwidgets

	make -j$(nproc)
	sudo make install

	rm -rf ~/$EMACS_DOWNLOAD_DIRECTORY
	rm -rf ~/$EMACS_DOWNLOAD_DIRECTORY.tar.gz
fi
