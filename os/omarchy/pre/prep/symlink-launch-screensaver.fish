#!/usr/bin/env fish

function symlink-launch-screensaver
    running-message symlink-launch-screensaver

    create-directory-if-not-exists $HOME/.local/bin

    # hypr/hypridle.conf calls this by name, so it has to resolve on PATH
    make-symlink $DOTFILES_DIRECTORY/hypr/launch-screensaver $HOME/.local/bin/launch-screensaver
end
