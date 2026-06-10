#!/usr/bin/env fish

function create-directory-if-not-exists
    set -l dir $argv[1]

    if test -z "$dir"
        error-message "create-directory-if-not-exists: missing directory argument"
        return 1
    end

    if not test -d $dir
        mkdir -p $dir

        information-message "created directory $dir"
    else
        success-message "$dir directory already exists"
    end
end
