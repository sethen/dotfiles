fpath=( ~/.zsh/functions/global "${fpath[@]}" )

autoload -Uz compinit && compinit
autoload -Uz error_message
autoload -Uz information_message
autoload -Uz pacman_install_if_package_not_exists
autoload -Uz pacman_remove_if_package_exists
autoload -Uz success_message
autoload -Uz yay_install_if_package_not_exists
