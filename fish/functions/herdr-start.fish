#!/usr/bin/env fish

function herdr-start
    herdr server &>/dev/null &
    sleep 1

    set -l agents (herdr agent list 2>/dev/null | jq -r '.result.agents[]?.agent // empty' 2>/dev/null)

    if test (count $agents) -eq 0
        create-agent-workspace claude claude
        create-agent-workspace opencode opencode

        for ws in (
            herdr workspace list \
            | jq -r '.result.workspaces[]
                | select(.label != "claude" and .label != "opencode")
                | .workspace_id'
        )
            herdr workspace close $ws >/dev/null 2>&1
        end
    end

    herdr
end
