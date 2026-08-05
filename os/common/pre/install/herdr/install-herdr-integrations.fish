#!/usr/bin/env fish

function install-herdr-integrations
    running-message install-herdr-integrations

    if not type -q herdr
        error-message "herdr not found in PATH, skipping integrations"

        return 1
    end

    # herdr reads agent state through a per-agent hook it installs into that
    # agent's own config directory. Without it the sidebar state columns stay
    # empty and `herdr agent wait --status idle` never resolves, so every
    # workspace creation burns its full timeout.
    for integration in claude opencode
        if herdr integration status | grep -q "^$integration: not installed"
            information-message "installing herdr $integration integration"

            herdr integration install $integration
        else
            success-message "herdr $integration integration already installed"
        end
    end
end
