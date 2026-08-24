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

    delete-if-exists $dest

    if not ln -sfnv $src $dest
        error-message "failed to symlink $src -> $dest"
        return 1
    end
end
