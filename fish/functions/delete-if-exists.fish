#!/usr/bin/env fish

function delete-if-exists
    for path in $argv
        if test -e "$path" || test -L "$path"
            rm -rf "$path"
        end
    end
end
