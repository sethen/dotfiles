fpath=( ~/.zsh/functions "${fpath[@]}" )

autoload -Uz compinit && compinit

# directories
export CONFIG_DIRECTORY=~/.config
export DEVELOPER_DIRECTORY=~/Developer
export DISTRO_ZSH_FUNCTIONS_DIRECTORY=$PRESENT_WORKING_DIRECTORY/distro/$DISTRO/zsh-functions
export HOME_ZSH_FUNCTIONS_DIRECTORY=~/.zsh/functions
export OS_ZSH_FUNCTIONS_DIRECTORY=$PRESENT_WORKING_DIRECTORY/os/zsh-functions

# files
export DISTRO_ALIASES_FILE=$PRESENT_WORKING_DIRECTORY/distro/$DISTRO/.aliases
export DISTRO_ZSHENV_FILE=$PRESENT_WORKING_DIRECTORY/distro/$DISTRO/.zshenv
export DISTRO_ZSHRC_FILE=$PRESENT_WORKING_DIRECTORY/distro/$DISTRO/.zshrc
export HOME_ALIASES_FILE=~/.aliases
export HOME_ZSHENV_FILE=~/.zshenv
export HOME_ZSHRC_FILE=~/.zshrc
export OS_ALIASES_FILE=$PRESENT_WORKING_DIRECTORY/os/.aliases
export OS_ZSHENV_FILE=$PRESENT_WORKING_DIRECTORY/os/.zshenv
export OS_ZSHRC_FILE=$PRESENT_WORKING_DIRECTORY/os/.zshrc

# versions
export RUBY_VERSION=3.2.2

# zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS_DIRECTORY=~/.zsh/zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS_FILE=$ZSH_AUTOSUGGESTIONS_DIRECTORY/zsh-autosuggestions.zsh
