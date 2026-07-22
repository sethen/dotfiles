#!/usr/bin/env fish

function configure-user
    running-message configure-user

    # load anything captured on a previous run so we only prompt for what's missing
    test -f $DOTFILES_DIRECTORY/user.fish; and source $DOTFILES_DIRECTORY/user.fish

    configure-developer-directory
    configure-git-identity
end
