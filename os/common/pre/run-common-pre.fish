#!/usr/bin/env fish

function run-common-pre
    running-message run-common-pre

    # global
    switch-shell-to-fish

    # bootstrap mise + gum before anything else
    make-config-directory
    make-mise-directory
    symlink-mise-config-files
    install-mise
    # config.fish puts mise on PATH for interactive shells, but a fresh run
    # inherits none of that, and everything below needs mise reachable
    test -x $HOME/.local/bin/mise; and fish_add_path -m $HOME/.local/bin
    # mise's tool registry is compiled into the binary, so a mise older than a
    # tool's registry entry cannot resolve that tool by name and `mise install`
    # fails the same way on every run. Update mise before anything installs
    # through it, not after. install-mise only fetches mise when absent, so this
    # is the sole thing keeping a long-lived machine current. One exception: a
    # mise from a system package manager (pacman on omarchy, apt, brew) is built
    # with self-update compiled out, so calling it there only prints errors and
    # the platform update in the per-platform pre script moves it instead.
    if string match -q "$HOME/*" -- (command -v mise)
        mise self-update --yes
        or error-message "mise self-update failed"
    else
        information-message "mise is package-managed, platform update keeps it current"
    end
    # gum is a mise-managed tool (not a system package) and configure-user needs
    # it to prompt on a fresh machine, so bootstrap it before anything else
    if not type -q gum
        mise install gum
        mise env fish | source
    end

    # user — prompt for anything not yet configured before the steps below need it
    configure-user

    # prep
    #-> files
    make-developer-directory
    make-bun-directory
    # bun reads its global root from BUN_INSTALL (set in run.fish), so its bin
    # goes on the path here, once make-bun-directory has created it. Without
    # this the `type -q` guards in run-common-main never see an install and
    # every run reinstalls all of them
    fish_add_path -m $BUN_INSTALL/bin
    symlink-fish-config-file
    symlink-fish-functions-directory
    symlink-git-config-files
    symlink-opencode-config-files
    symlink-neovim-config-directory
    symlink-starship-config-directory
    symlink-wezterm-config-directory
    symlink-yazi-config-directory
    symlink-herdr-config
    #-> permissions
    add-user-to-docker-group

    # install
    #-> mise (remaining tools)
    mise install
    # `mise install` only fills in what's missing. An already-installed tool
    # satisfies a `latest` spec forever, so versions never move on their own.
    # Bumping them takes an explicit upgrade, gated behind the update flag to
    # match brew/apt/pacman in the per-platform pre scripts.
    if test "$RUN_DOTFILES_UPDATE" = true
        # no --bump: this keeps the ranges in mise.toml, so `latest` specs move
        # to newest and pinned versions stay pinned
        mise upgrade
    else
        information-message "run dotfiles update flag not found, skipping mise upgrade"
    end
    mise env fish | source
    verify-mise-tools
    #-> herdr
    install-herdr-integrations
    #-> go

    # github
    authenticate-github
end
