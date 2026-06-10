#!/usr/bin/env fish

function delete-if-exists
    if test (count $argv) -eq 0
        error-message "delete-if-exists: missing path argument"
        return 1
    end

    for path in $argv
        if test -e "$path" || test -L "$path"
            rm -rf "$path"
        end
    end
end
