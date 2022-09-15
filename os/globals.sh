#!/bin/zsh

# directories
export ETC_APT_DIRECTORY=/etc/apt/
export ETC_APT_SOURCES_DIRECTORY=$ETC_APT_DIRECTORY/sources.list.d
export CONFIG_DIRECTORY=~/.config
export DEVELOPER_DIRECTORY=~/Developer
export ETC_APT_KEYRINGS_DIRECTORY=$ETC_APT_DIRECTORY/keyrings

# ruby
export RUBY_VERSION=3.1.0

# chruby
export CHRUBY_FILE=/usr/local/share/chruby/chruby.sh
export RUBY_DIRECTORY=ruby-$RUBY_VERSION
export OPT_RUBIES_DIRECTORY=/opt/rubies/$RUBY_DIRECTORY

# docker
export DOCKER_DIRECTORY=~/.docker
export DOCKER_CLI_PLUGINS_DIRECTORY=$DOCKER_DIRECTORY/cli-plugins

# emacs
export EMACS_DIRECTORY=~/.emacs.d
export EMACS_LIGATURE_DIRECTORY=$DEVELOPER_DIRECTORY/ligature.el

# go
export DEVELOPER_GO_DIRECTORY=$DEVELOPER_DIRECTORY/go
export GO_BIN=/usr/bin/go
export GOPLS=$DEVELOPER_GO_DIRECTORY/bin/gopls

# node
export NODE_VERSION=16.x

# npm
export NPM_PACKAGES_DIRECTORY=~/.npm-packages
export NPM_PACKAGES_BIN_DIRECTORY=$NPM_PACKAGES_DIRECTORY/bin
export NPM_CONFIG_PREFIX=$NPM_PACKAGES_DIRECTORY

# rust
export CARGO_BIN_DIRECTORY=~/.cargo/bin
export RUST_ANALYZER_VERSION=2021-11-08

# zsh
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh

# files
export ALIASES=~/.aliases
export ZSHENV=~/.zshenv
export ZSHRC=~/.zshrc
