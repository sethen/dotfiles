#!/usr/bin/env fish

function clone-dotfiles-repo
    running-message clone-dotfiles-repo

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
