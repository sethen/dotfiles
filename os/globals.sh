#!/bin/zsh

# rust
export CARGO_BIN_DIRECTORY=~/.cargo/bin

# directories
export ETC_APT_DIRECTORY=/etc/apt/
export ETC_APT_SOURCES_DIRECTORY=$ETC_APT_DIRECTORY/sources.list.d
export CONFIG_DIRECTORY=~/.config
export DEVELOPER_DIRECTORY=~/Developer
export ETC_APT_KEYRINGS_DIRECTORY=$ETC_APT_DIRECTORY/keyrings

# emacs
export EMACS_DIRECTORY=~/.emacs.d
export EMACS_LIGATURE_DIRECTORY=$DEVELOPER_DIRECTORY/ligature.el
export EMACS_VERSION=28.2
export EMACS_DOWNLOAD_DIRECTORY=emacs-$EMACS_VERSION

#go
export GO_USR_LOCAL_BIN_DIRECTORY=/usr/local/go/bin
export GO_BIN_DIRECTORY=~/go/bin
export GO_VERSION=1.20.2
export GO_DOWNLOAD_DIRECTORY=go-$GO_VERSION

# node
export NODE_VERSION=18.x

# npm
export NPM_PACKAGES_DIRECTORY=~/.npm-packages
export NPM_PACKAGES_BIN_DIRECTORY=$NPM_PACKAGES_DIRECTORY/bin
export NPM_CONFIG_PREFIX=$NPM_PACKAGES_DIRECTORY

# zsh
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh

# files
export ALIASES=~/.aliases
export ZSHENV=~/.zshenv
export ZSHRC=~/.zshrc
