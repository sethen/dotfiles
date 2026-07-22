#!/usr/bin/env fish

function configure-developer-directory
    # captured on a previous run — leave it be
    if has-user-value DEVELOPER_DIRECTORY
        return
    end

    set -gx DEVELOPER_DIRECTORY (prompt-value "developer directory (where your code lives)" $HOME/Developer)
    persist-user-value DEVELOPER_DIRECTORY $DEVELOPER_DIRECTORY
end
