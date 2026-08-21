#!/usr/bin/env fish

function clone-dotfiles-repo
    running-message clone-dotfiles-repo

    # every symlink this run made points back at whichever copy of the repo it
    # ran from. Running from a scratch location (a ~/Downloads unzip, say) leaves
    # the whole config pointing somewhere disposable, so say so before cloning a
    # second copy that nothing links to
    if test "$DOTFILES_DIRECTORY" != "$DEVELOPER_DIRECTORY/dotfiles"
        error-message "run from $DOTFILES_DIRECTORY, so every symlink points there"
        error-message "rerun from $DEVELOPER_DIRECTORY/dotfiles to repoint them"
    end

    if test -d $DEVELOPER_DIRECTORY/dotfiles
        success-message 'dotfiles repo already cloned'

        return
    end

    # the dotfiles come from sethen's account, so they are always cloned from there —
    # ask before pulling them onto this machine
    if not prompt-confirm "clone sethen's dotfiles?"
        information-message 'skipping dotfiles repo'

        return
    end

    information-message "cloning sethen's dotfiles repo"
    git clone git@github.com:sethen/dotfiles.git $DEVELOPER_DIRECTORY/dotfiles
end
