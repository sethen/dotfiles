#!/usr/bin/env fish

function authenticate-github
    running-message authenticate-github

    if not type -q gh
        error-message "gh CLI not found in PATH"
        return 1
    end

    if gh auth status >/dev/null 2>&1
        success-message "github already authenticated"
    else
        information-message "logging into github"

        gh auth login
    end
end
