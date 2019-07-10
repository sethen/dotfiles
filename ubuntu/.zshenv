fpath=( ~/.zsh/functions/global "${fpath[@]}" )

autoload -Uz compinit && compinit
autoload -Uz apt_get_install_if_package_not_exists
autoload -Uz error_message
autoload -Uz header_message
autoload -Uz information_message
autoload -Uz substitute_icon_name
autoload -Uz success_message
