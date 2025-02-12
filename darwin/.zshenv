fpath=( ~/.zsh/functions "${fpath[@]}" )

autoload -Uz compinit && compinit

# chruby
export CHRUBY_SHELL_FILE=/opt/homebrew/opt/chruby/share/chruby/chruby.sh

# directories
export CONFIG_DIRECTORY=~/.config
export DEVELOPER_DIRECTORY=~/Developer
export HOME_ALIASES=~/.aliases
export ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions


# files
export ALIASES=~/.aliases

# ruby
export RUBY_VERSION=3.2.2
export RUBY_BIN=~/.rubies/ruby-$RUBY_VERSION/bin/ruby

# zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh
