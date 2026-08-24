#!/usr/bin/env fish

function create-directory-if-not-exists
    set -l dir $argv[1]

    if test -z "$dir"
        error-message "create-directory-if-not-exists: missing directory argument"
        return 1
    end

    if not test -d $dir
        if not mkdir -p $dir
            error-message "failed to create $dir"
            return 1
        end

        information-message "created directory $dir"
    else
        success-message "$dir directory already exists"
    end
end
