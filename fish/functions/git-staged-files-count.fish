#!/usr/bin/env fish

function git-staged-files-count
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "currently not in a git repository"

        return 2
    end

    echo $(git diff --name-only --cached | wc -l)
end
