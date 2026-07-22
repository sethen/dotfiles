#!/usr/bin/env fish

function clone-wallpapers-repo
    running-message clone-wallpapers-repo

    if test -d $DEVELOPER_DIRECTORY/wallpapers
        success-message 'wallpapers repo already cloned'

        return
    end

    # the wallpapers repo only lives under sethen's account, so it is always cloned
    # from there — ask before pulling someone else's wallpapers onto this machine
    if not prompt-confirm "clone sethen's wallpapers?"
        information-message 'skipping wallpapers repo'

        return
    end

    information-message "cloning sethen's wallpapers repo"
    git clone git@github.com:sethen/wallpapers.git $DEVELOPER_DIRECTORY/wallpapers
end
