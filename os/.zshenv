fpath=( ~/.zsh/functions "${fpath[@]}" )

autoload -Uz compinit && compinit

# apt
export ETC_APT_SOURCES_DIRECTORY=/etc/apt/sources.list.d

# chruby
export CHRUBY_VERSION=0.3.9
export CHRUBY_SHELL_FILE=/usr/local/share/chruby/chruby.sh

# directories
export DEVELOPER_DIRECTORY=~/Developer
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions

# emacs
export EMACS_VERSION=29.0.92

# files
export ALIASES=~/.aliases

# go
export GO_BIN_DIRECTORY=~/go/bin
export GO_USR_LOCAL_BIN_DIRECTORY=/usr/local/go/bin
export GO_BIN=$GO_USR_LOCAL_BIN_DIRECTORY/go
export GO_VERSION=1.20.2

# ruby
export RUBY_VERSION=3.2.2

# ruby-install
export RUBY_INSTALL_VERSION=0.9.0

# volta
export VOLTA_DIRECTORY=~/.volta
export VOLTA_BIN_DIRECTORY=$VOLTA_DIRECTORY/bin

# zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh
