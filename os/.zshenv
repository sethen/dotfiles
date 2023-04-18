fpath=( ~/.zsh/functions "${fpath[@]}" )

autoload -Uz compinit && compinit

# directories
export DEVELOPER_DIRECTORY=~/Developer

# apt
export ETC_APT_SOURCES_DIRECTORY=/etc/apt/sources.list.d

# rust
export CARGO_BIN_DIRECTORY=~/.cargo/bin

# emacs
export EMACS_DIRECTORY=~/.emacs.d
export EMACS_LIGATURE_DIRECTORY=$DEVELOPER_DIRECTORY/ligature.el
export EMACS_VERSION=28.2
export EMACS_DOWNLOAD_DIRECTORY=emacs-$EMACS_VERSION

#go
export GO_BIN_DIRECTORY=~/go/bin
export GO_VERSION=1.20.2
export GO_USR_LOCAL_BIN_DIRECTORY=/usr/local/go/bin
export GO_DOWNLOAD_DIRECTORY=go-$GO_VERSION

# node
export NODE_VERSION=18.x

# npm
export NPM_PACKAGES_DIRECTORY=~/.npm-packages
export NPM_PACKAGES_BIN_DIRECTORY=$NPM_PACKAGES_DIRECTORY/bin

# chruby
export CHRUBY_DOWNLOAD_DIRECTORY=chruby-$CHRUBY_VERSION
export CHRUBY_SHELL_FILE=/usr/local/share/chruby/chruby.sh
export CHRUBY_VERSION=0.3.9

# ruby-install
export RUBY_INSTALL_VERSION=0.9.0
export RUBY_INSTALL_DOWNLOAD_DIRECTORY=ruby-install-$RUBY_INSTALL_VERSION

# ruby
export RUBY_VERSION=3.2.2
export RUBY_BIN=~/.rubies/ruby-$RUBY_VERSION/bin/ruby
export RUBY_GEM_BIN=~/.rubies/ruby-$RUBY_VERSION/bin/gem

# zsh
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh

# files
export ALIASES=~/.aliases
export ZSHENV=~/.zshenv
