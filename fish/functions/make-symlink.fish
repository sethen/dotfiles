#!/usr/bin/env fish

function make-symlink
    set -l src $argv[1]
    set -l dest $argv[2]

    if test -z "$src"; or test -z "$dest"
        error-message "make-symlink: requires source and destination arguments"
        return 1
    end

    if not test -e $src
        error-message "make-symlink: source does not exist: $src"
        return 1
    end

    # leave a link that is already right alone. deleting and recreating it on
    # every run leaves a moment where the file is missing, and hyprland, which
    # reloads when a config file changes, reloads in that gap and reports the
    # file as not found
    if test -L $dest; and test (readlink $dest) = $src
        success-message "$dest already linked"
        return
    end

    delete-if-exists $dest

    if not ln -sfnv $src $dest
        error-message "failed to symlink $src -> $dest"
        return 1
    end
end
