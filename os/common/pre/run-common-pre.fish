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
    # config.fish makes mise + its tools available in interactive shells, but a
    # fresh run inherits none of that. If gum isn't reachable yet, bootstrap it:
    # put mise on PATH, install gum, then activate the tool env for this run.
    if not type -q gum
        test -x $HOME/.local/bin/mise; and fish_add_path -m $HOME/.local/bin
        mise install gum
        mise env fish | source
    end

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
