#!/usr/bin/env fish

function create-agent-workspace --argument label command
    set -l ws (
        herdr workspace create --label $label --no-focus \
        | jq -r '.result.workspace.workspace_id'
    )

    herdr agent start $label --workspace $ws --split down -- $command >/dev/null 2>&1
    herdr agent wait $label --status idle --timeout 10000 >/dev/null 2>&1

    for i in (seq 1 30)
        set -l shell (
            herdr pane list 2>/dev/null \
            | jq -r --arg ws $ws '
                .result.panes[]
                | select(.workspace_id == $ws and .agent == null)
                | .pane_id
            '
        )

        if test -n "$shell"
            set -l agent (
                herdr pane list 2>/dev/null \
                | jq -r --arg ws $ws '
                    .result.panes[]
                    | select(.workspace_id == $ws and .agent != null)
                    | .pane_id
                '
            )
            herdr pane swap --source-pane $shell --target-pane $agent >/dev/null 2>&1
            herdr pane resize --direction down --amount 0.30 --pane $shell >/dev/null 2>&1
            break
        end

        sleep 0.1
    end
end
