#!/usr/bin/env fish

function create-directory-if-not-exists
    set -l dir $argv[1]

    if not test -d $dir
        mkdir -p $dir

        information-message "created directory $dir"
    else
        success-message "$dir directory already exists"
    end
end
