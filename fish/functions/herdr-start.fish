#!/usr/bin/env fish

function herdr-start
    # setsid, and only when no server answers. as a plain background job the server
    # shared the pane's process group, so closing the tab - or restarting wezterm,
    # which kills the mux and every pane with it - killed the server and took both
    # agents down with it. the next herdr-start then found no agents and recreated
    # them, which is why claude and opencode came back as new tabs every time.
    if not herdr agent list >/dev/null 2>&1
        setsid herdr server >/dev/null 2>&1 &

        sleep 1
    end

    set -l agents (herdr agent list 2>/dev/null | jq -r '.result.agents[]?.agent // empty' 2>/dev/null)
    set -l running (count $agents)

    # Prune before creating, and on a cold start prune everything. herdr restores the
    # previous session's workspaces from disk, but not the agents that were running
    # in them, so on a cold start every restored workspace is an empty shell - the
    # claude and opencode ones included. The old prune excluded those two labels and
    # ran after creation, so each start left the stale pair in place and added a live
    # pair beside it, which is how the agent tabs multiplied.
    #
    # Only on a cold start: mid-session, $agents is non-empty and workspaces opened
    # by hand must survive a single agent being restarted.
    if test $running -eq 0
        for ws in (herdr workspace list | jq -r '.result.workspaces[].workspace_id')
            herdr workspace close $ws >/dev/null 2>&1
        end
    end

    # Check each agent individually. The previous all-or-nothing guard meant that
    # if one agent survived and the other died, the surviving one suppressed the
    # restart of the dead one and its pane was left sitting at a bare shell.
    for agent in claude opencode
        if not contains -- $agent $agents
            create-agent-workspace $agent $agent
        end
    end

    herdr
end
