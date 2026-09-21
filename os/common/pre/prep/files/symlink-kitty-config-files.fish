#!/usr/bin/env fish

function symlink-kitty-config-files
    running-message symlink-kitty-config-files

    # files rather than the whole directory: os-local.conf has to be a
    # per-machine symlink living beside the shared files, which is not possible
    # if ~/.config/kitty is itself a link into the repo.
    create-directory-if-not-exists $HOME_CONFIG_DIRECTORY/kitty

    make-symlink $DOTFILES_DIRECTORY/kitty/kitty.conf $HOME_CONFIG_DIRECTORY/kitty/kitty.conf
    make-symlink $DOTFILES_DIRECTORY/kitty/tab_bar.py $HOME_CONFIG_DIRECTORY/kitty/tab_bar.py
    make-symlink $DOTFILES_DIRECTORY/kitty/tab-search.sh $HOME_CONFIG_DIRECTORY/kitty/tab-search.sh
    make-symlink $DOTFILES_DIRECTORY/kitty/session-search.sh $HOME_CONFIG_DIRECTORY/kitty/session-search.sh
    make-symlink $DOTFILES_DIRECTORY/kitty/sessions $HOME_CONFIG_DIRECTORY/kitty/sessions

    # machine-local overrides, gitignored because this repo is public. Absent on
    # a fresh clone, and that is fine: kitty.conf reaches it with globinclude,
    # which matches nothing when the directory is not there.
    if test -d $DOTFILES_DIRECTORY/kitty/local
        make-symlink $DOTFILES_DIRECTORY/kitty/local $HOME_CONFIG_DIRECTORY/kitty/local
    end

    # kitty has no conditional include, so the platform picks the file and
    # kitty.conf includes it under a fixed name. One script for every OS rather
    # than one per platform prep directory.
    switch $SYSTEM_OS
        case darwin
            make-symlink $DOTFILES_DIRECTORY/kitty/os/darwin.conf $HOME_CONFIG_DIRECTORY/kitty/os-local.conf
        case '*'
            make-symlink $DOTFILES_DIRECTORY/kitty/os/linux.conf $HOME_CONFIG_DIRECTORY/kitty/os-local.conf
    end
end
