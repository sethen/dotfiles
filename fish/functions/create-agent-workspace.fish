#!/usr/bin/env fish

function create-agent-workspace --argument label command
    set -l ws (
        herdr workspace create --label $label --no-focus \
        | jq -r '.result.workspace.workspace_id'
    )

    set -l pane (
        herdr pane list 2>/dev/null \
        | jq -r --arg ws $ws '
            .result.panes[]
            | select(.workspace_id == $ws)
            | .pane_id
        ' | head -n 1
    )

    # `herdr agent start` takes --kind and --pane; it attaches to an existing pane
    # rather than creating its own split. The older --workspace/--split form now
    # exits 2 with "unknown option", which the previous >/dev/null hid completely.
    #
    # The pane also has to reach its interactive shell prompt first, otherwise the
    # call fails agent_pane_busy, so retry until it takes.
    set -l started
    for i in (seq 1 40)
        if herdr agent start $label --kind $command --pane $pane 2>/dev/null \
            | string match -q '*"type":"agent_started"*'
            set started yes

            break
        end

        sleep 0.5
    end

    if test -z "$started"
        echo "create-agent-workspace: $label failed to start in $ws" >&2

        return 1
    end

    # Shell below the agent. --ratio is the share kept by the pane being split,
    # not the share given to the new one, so 0.85 leaves the agent at 85% and
    # drops the shell into the remaining 15%. Lower it to give the shell more.
    herdr pane split --pane $pane --direction down --ratio 0.85 >/dev/null 2>&1
    herdr agent wait $label --status idle --timeout 10000 >/dev/null 2>&1
end
