#!/usr/bin/env fish

function run-common-pre
    running-message run-common-pre

    # global
    switch-shell-to-fish

    # prep
    #-> files
    make-config-directory
    make-developer-directory
    make-mise-directory
    make-tmux-directory
    symlink-fish-config-file
    symlink-fish-functions-directory
    symlink-ghostty-config-directory
    symlink-git-config-files
    symlink-mise-config-files
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
    #-> curl
    install-mise
    # add mise to PATH for this run; installer doesn't touch the live shell
    test -x $HOME/.local/bin/mise; and fish_add_path -m $HOME/.local/bin
    #-> mise
    mise install
    mise env fish | source
    #-> go
    install-sesh

    # github
    authenticate-github
end
