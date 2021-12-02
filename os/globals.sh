#!/bin/zsh

# directories
export APT_SOURCES_DIRECTORY=/etc/apt/sources.list.d
export CONFIG_DIRECTORY=~/.config
export DEVELOPER_DIRECTORY=~/Developer

# go
export DEVELOPER_GO_DIRECTORY=$DEVELOPER_DIRECTORY/go
export GO_BIN=/usr/bin/go
export GOPLS=$DEVELOPER_GO_DIRECTORY/bin/gopls

# docker
export DOCKER_DIRECTORY=~/.docker
export DOCKER_CLI_PLUGINS_DIRECTORY=$DOCKER_DIRECTORY/cli-plugins
export DOCKER_COMPOSE_VERSION=2.0.1

# dotnet core
export DOTNET_DIRECTORY=~/.dotnet
export DOTNET_CORE_VERSION=5.0
export DOTNET_TOOLS_DIRECTORY=$DOTNET_DIRECTORY/tools

# emacs
export EMACS_DIRECTORY=~/.emacs.d
export EMACS_LIGATURE_DIRECTORY=$DEVELOPER_DIRECTORY/ligature.el

# npm
export NPM_PACKAGES_DIRECTORY=~/.npm-packages
export NPM_PACKAGES_BIN_DIRECTORY=$NPM_PACKAGES_DIRECTORY/bin
export NPM_CONFIG_PREFIX=$NPM_PACKAGES_DIRECTORY

# rbenv
export RBENV_DIRECTORY=~/.rbenv
export RBENV_BIN_DIRECTORY=$RBENV_DIRECTORY/bin
export RBENV_PLUGINS_DIRECTORY=$RBENV_DIRECTORY/plugins
export RBENV_VERSION_BIN_DIRECTORY=$RBENV_DIRECTORY/versions/$RUBY_VERSION/bin

# ripgrep
export RIPGREP_VERSION=11.0.2

# ruby
export RUBY_VERSION=3.0.1

# rust
export CARGO_BIN_DIRECTORY=~/.cargo/bin
export RUST_ANALYZER_VERSION=2021-11-08

# tmux
export TMUX_PLUGINS_DIRECTORY=~/.tmux/plugins
export TPM=$TMUX_PLUGINS_DIRECTORY/tpm

# zsh
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh

# files
export ALIASES=~/.aliases
export FZF=~/.fzf.zsh
export ZSHENV=~/.zshenv
export ZSHRC=~/.zshrc
