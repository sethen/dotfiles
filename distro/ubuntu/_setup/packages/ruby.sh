#!/bin/zsh

if [[ -a $CHRUBY_SHELL_FILE ]]; then
    success-message 'chruby installed'
else
    CHRUBY_DOWNLOAD_DIRECTORY=chruby-$CHRUBY_VERSION

    information-message 'installing chruby'

    wget -O ~/$CHRUBY_DOWNLOAD_DIRECTORY.tar.gz https://github.com/postmodern/chruby/archive/v$CHRUBY_VERSION.tar.gz
    tar -xvf ~/$CHRUBY_DOWNLOAD_DIRECTORY.tar.gz -C ~

    cd ~/$CHRUBY_DOWNLOAD_DIRECTORY

    sudo make install
    sudo ./scripts/setup.sh

    rm -rf ~/$CHRUBY_DOWNLOAD_DIRECTORY
    rm -rf ~/$CHRUBY_DOWNLOAD_DIRECTORY.tar.gz

    cd
fi

if (( $+commands[ruby-install] )); then
    success-message 'ruby-install installed'
else
    information-message 'installing ruby-install'

    RUBY_INSTALL_VERSION=0.9.0
    RUBY_INSTALL_DOWNLOAD_DIRECTORY=ruby-install-$RUBY_INSTALL_VERSION

    wget -O ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz
    tar -xzvf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz -C ~

    cd ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY

    sudo make install

    rm -rf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY
    rm -rf ~/$RUBY_INSTALL_DOWNLOAD_DIRECTORY.tar.gz

    cd
fi

if (( $+commands[ruby] )); then
    success-message 'ruby installed'
else
    information-message 'installing ruby'

    ruby-install ruby $RUBY_VERSION

    # set ruby
    information-message 'setting ruby version'

    . $CHRUBY_SHELL_FILE
    chruby ruby-$RUBY_VERSION
fi

if (( $+commands[solargraph] )); then
    success-message 'solargraph installed'
else
    information-message 'installing solargraph'

    RUBY_GEM_BIN=~/.rubies/ruby-$RUBY_VERSION/bin/gem

    $RUBY_GEM_BIN install solargraph
fi
