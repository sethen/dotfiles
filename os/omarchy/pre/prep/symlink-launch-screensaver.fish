#!/usr/bin/env fish

function symlink-launch-screensaver
    running-message symlink-launch-screensaver

    create-directory-if-not-exists $HOME/.local/bin

    # under omarchy 3 hypridle.conf called our copy by its own name. omarchy 4
    # runs the idle timer inside the quickshell shell, which invokes
    # `omarchy-launch-screensaver` by bare name, so ours has to shadow the
    # packaged command instead of sitting beside it. ~/.local/bin precedes
    # /usr/bin on PATH, and the shim calls the packaged copy by absolute path.
    make-symlink $DOTFILES_DIRECTORY/hypr/omarchy-launch-screensaver $HOME/.local/bin/omarchy-launch-screensaver

    # the omarchy 3 name, left behind by an earlier run of this script. nothing
    # calls it now, and leaving it makes it look like it is still wired up.
    delete-if-exists $HOME/.local/bin/launch-screensaver
end
