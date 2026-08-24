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

    set -l BACKGROUNDS_DIRECTORY $HOME_CONFIG_DIRECTORY/omarchy/backgrounds

    create-directory-if-not-exists $BACKGROUNDS_DIRECTORY

    # omarchy reads user backgrounds per theme, from
    # ~/.config/omarchy/backgrounds/<theme-slug>, taking the slug from
    # ~/.local/state/omarchy/current/theme.name. Link the repo under every
    # installed theme so the wallpapers survive a theme switch.
    #
    # `omarchy theme bg next` enumerates with `find -L`, so a symlinked
    # directory resolves exactly like a real one, and new commits to the repo
    # appear without re-running this.
    for themes_directory in /usr/share/omarchy/themes $HOME_CONFIG_DIRECTORY/omarchy/themes
        if not test -d $themes_directory
            continue
        end

        for theme_directory in $themes_directory/*/
            set -l theme (path basename $theme_directory)
            set -l destination $BACKGROUNDS_DIRECTORY/$theme

            # make-symlink deletes the destination first, and that is an rm -rf.
            # A real directory here holds wallpapers this repo did not put there,
            # so leave it alone rather than destroy someone's collection
            if test -d $destination; and not test -L $destination
                error-message "$destination is a real directory, skipping"

                continue
            end

            make-symlink $WALLPAPERS_DIRECTORY $destination
        end
    end
end
