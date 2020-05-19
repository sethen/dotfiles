#!/bin/zsh

# versions
export RIPGREP_VERSION=11.0.2
export RUBY_VERSION=2.6.1
export TMUX_VERSION=3.0

# binaries
export GO_BIN=/usr/bin/go

# directories
export CARGO_BIN_DIRECTORY=~/.cargo/bin
export CONFIG_NVIM_DIRECTORY=~/.config/nvim
export DEVELOPER_DIRECTORY=~/Developer
export DEVELOPER_GO_DIRECTORY=~/Developer/go
export DOTNET_DIRECTORY=~/dotnet
export NPM_PACKAGES_DIRECTORY=~/.npm-packages
export NPM_PACKAGES_BIN_DIRECTORY=$NPM_PACKAGES_DIRECTORY/bin
export RBENV_DIRECTORY=~/.rbenv
export RBENV_BIN_DIRECTORY=$RBENV_DIRECTORY/bin
export RBENV_PLUGINS_DIRECTORY=$RBENV_DIRECTORY/plugins
export RBENV_VERSION_BIN_DIRECTORY=$RBENV_DIRECTORY/versions/$RUBY_VERSION/bin
export TMUX_PLUGINS_DIRECTORY=~/.tmux/plugins
export VIM_PLUG_DIRECTORY=~/.local/share/nvim/plugged
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions

# files
export ALIASES=~/.aliases
export FZF=~/.fzf.zsh
export TPM=$TMUX_PLUGINS_DIRECTORY/tpm
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh
export ZSHENV=~/.zshenv
export ZSHRC=~/.zshrc
