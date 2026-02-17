#!/usr/bin/env fish

function install-tmux-plugin-manager
    running-message install-tmux-plugin-manager

    set -l TMUX_PLUGINS_DIRECTORY ~/.config/tmux/plugins

    if not test -d "$TMUX_PLUGINS_DIRECTORY"
        echo $TMUX_PLUGINS_DIRECTORY
        information-message 'installing tmux plugin manager'

        mkdir -p "$TMUX_PLUGINS_DIRECTORY"
        git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGINS_DIRECTORY/tpm
    else
        success-message 'tmux plugin manager already installed'
    end
end
