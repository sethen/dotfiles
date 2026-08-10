#!/usr/bin/env fish

function herdr-start
    herdr server &>/dev/null &
    sleep 1

    set -l agents (herdr agent list 2>/dev/null | jq -r '.result.agents[]?.agent // empty' 2>/dev/null)
    set -l running (count $agents)

    # Check each agent individually. The previous all-or-nothing guard meant that
    # if one agent survived and the other died, the surviving one suppressed the
    # restart of the dead one and its pane was left sitting at a bare shell.
    for agent in claude opencode
        if not contains -- $agent $agents
            create-agent-workspace $agent $agent
        end
    end

    # Only prune stray workspaces on a genuinely cold start, so a mid-session
    # restart of a single agent never closes workspaces opened by hand.
    if test $running -eq 0
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
