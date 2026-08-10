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
    # Match on "current" rather than "not installed": an integration can also be
    # "outdated (vN < vM)" after a herdr upgrade, which is just as broken as a
    # missing one but was previously reported as already installed and skipped.
    for integration in claude opencode
        set -l integration_status (
            herdr integration status | string match -r "^$integration: .*"
        )

        if string match -q "$integration: current*" -- $integration_status
            success-message "herdr $integration integration current"
        else
            information-message "installing herdr $integration integration ($integration_status)"

            herdr integration install $integration
        end
    end
end
