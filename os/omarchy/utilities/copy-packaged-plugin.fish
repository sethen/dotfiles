#!/usr/bin/env fish

function copy-packaged-plugin
    # copy-packaged-plugin <source-directory> <destination> [single-file-name]
    #
    # Lays down a pristine copy of a packaged omarchy shell widget. Most widgets
    # are a directory; a few are one file inside a shared directory, which is
    # what the optional third argument names.

    set -l source $argv[1]
    set -l destination $argv[2]
    set -l single_file $argv[3]

    if not test -d $source
        error-message "copy-packaged-plugin: packaged source not found: $source"
        return 1
    end

    create-directory-if-not-exists $destination

    if test -n "$single_file"
        if not test -f $source/$single_file
            error-message "copy-packaged-plugin: $source/$single_file is gone; omarchy renamed or removed it"
            return 1
        end

        cp $source/$single_file $destination/$single_file
        return 0
    end

    # manifest.json names the built-in id and is written separately, and
    # README.md documents the upstream plugin and is never loaded.
    for entry in $source/*
        set -l name (basename $entry)

        contains $name manifest.json README.md; and continue

        cp -r $entry $destination/$name
    end
end
