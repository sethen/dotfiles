#!/usr/bin/env fish

function symlink-omarchy-hooks
    running-message symlink-omarchy-hooks

    # omarchy runs every executable in these .d directories after the matching
    # event. relink-dotfiles repairs the symlinks an update can detach, so it
    # has to be installed for the repo to survive `omarchy update` unattended.
    set -l POST_UPDATE_DIRECTORY $HOME_CONFIG_DIRECTORY/omarchy/hooks/post-update.d

    create-directory-if-not-exists $POST_UPDATE_DIRECTORY

    make-symlink $DOTFILES_DIRECTORY/os/omarchy/hooks/relink-dotfiles.hook $POST_UPDATE_DIRECTORY/relink-dotfiles.hook
end
