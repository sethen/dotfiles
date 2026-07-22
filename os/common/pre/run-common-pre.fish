#!/usr/bin/env fish

function run-common-pre
    running-message run-common-pre

    # global
    switch-shell-to-fish

    # bootstrap mise + gum before anything else: gum is a mise-managed tool (not a
    # system package), and configure-user needs it to prompt on a fresh machine
    make-config-directory
    make-mise-directory
    symlink-mise-config-files
    install-mise
    # config.fish adds mise to PATH for interactive shells, but that isn't loaded
    # during a fresh run — so if mise isn't reachable yet, add it for this run
    if not type -q mise; and test -x $HOME/.local/bin/mise
        fish_add_path -m $HOME/.local/bin
    end
    mise install gum
    mise env fish | source

    # user — prompt for anything not yet configured before the steps below need it
    configure-user

    # prep
    #-> files
    make-developer-directory
    make-tmux-directory
    symlink-fish-config-file
    symlink-fish-functions-directory
    symlink-ghostty-config-directory
    symlink-git-config-files
    symlink-opencode-config-files
    symlink-neovim-config-directory
    symlink-sesh-config-directory
    symlink-starship-config-directory
    symlink-tmux-config-file
    symlink-yazi-config-directory
    symlink-zellij-config-file
    #-> permissions
    add-user-to-docker-group

    # install
    #-> mise (remaining tools)
    mise install
    mise env fish | source
    #-> go
    install-sesh

    # github
    authenticate-github
end
