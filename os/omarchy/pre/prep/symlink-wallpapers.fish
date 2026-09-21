#!/usr/bin/env fish

# lives with the other omarchy symlink prep steps, but run-omarchy-main calls
# it rather than run-omarchy-pre: pre runs before configure-user sets
# DEVELOPER_DIRECTORY and before clone-wallpapers-repo fetches the repo, so
# calling it there would skip on every fresh machine
function symlink-wallpapers
    running-message symlink-wallpapers

    set -l WALLPAPERS_DIRECTORY $DEVELOPER_DIRECTORY/wallpapers

    # the repo is optional: clone-wallpapers-repo asks before pulling it, so a
    # machine that declined should still finish the run
    if not test -d $WALLPAPERS_DIRECTORY
        information-message "no wallpapers repo at $WALLPAPERS_DIRECTORY, skipping"

        return
    end

    # omarchy reads user backgrounds per theme, from
    # ~/.config/omarchy/backgrounds/<theme-slug>, taking the slug from
    # ~/.local/state/omarchy/current/theme.name
    set -l THEME_NAME_FILE $HOME/.local/state/omarchy/current/theme.name

    if not test -f $THEME_NAME_FILE
        information-message "no active omarchy theme at $THEME_NAME_FILE, skipping"

        return
    end

    set -l theme (string trim (cat $THEME_NAME_FILE))

    if test -z "$theme"
        error-message "$THEME_NAME_FILE is empty, skipping"

        return
    end

    set -l BACKGROUNDS_DIRECTORY $HOME_CONFIG_DIRECTORY/omarchy/backgrounds

    create-directory-if-not-exists $BACKGROUNDS_DIRECTORY

    # only the active theme gets the repo: linking every installed theme fills
    # `omarchy theme bg next` with the same wallpapers no matter which theme is
    # on. Switching themes needs another run of this to move the link
    set -l destination $BACKGROUNDS_DIRECTORY/$theme

    # make-symlink deletes the destination first, and that is an rm -rf.
    # A real directory here holds wallpapers this repo did not put there, so
    # leave it alone rather than destroy someone's collection
    if test -d $destination; and not test -L $destination
        error-message "$destination is a real directory, skipping"

        return
    end

    # `omarchy theme bg next` enumerates with `find -L`, so a symlinked
    # directory resolves exactly like a real one, and new commits to the repo
    # appear without re-running this
    make-symlink $WALLPAPERS_DIRECTORY $destination
end
