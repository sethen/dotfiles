#!/usr/bin/env fish

function verify-mise-tools
    running-message verify-mise-tools

    # `mise install` exits 0 even when a tool in mise.toml never landed, so a
    # typo or a name missing from mise's registry fails silently and stays
    # broken across every later run. Report anything still missing.
    set -l MISSING (mise ls --missing 2>/dev/null | string trim | string match -rv '^$')

    if test (count $MISSING) -eq 0
        success-message "all mise tools installed"

        return 0
    end

    error-message "mise tools requested in mise.toml but not installed:"

    for tool in $MISSING
        error-message "  $tool"
    end

    error-message "check the tool name against `mise registry <name>`"

    return 1
end
