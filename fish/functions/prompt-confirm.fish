#!/usr/bin/env fish

function prompt-confirm
    # usage: prompt-confirm <message> — catppuccin-styled yes/no (affirmative -> exit 0)
    if test (count $argv) -eq 0
        error-message "prompt-confirm: requires a message argument"

        return 1
    end

    if not type -q gum
        error-message "prompt-confirm: gum not found in PATH"

        return 1
    end

    # catppuccin mocha: blue question, blue selected button on base, muted unselected
    gum confirm $argv[1] \
        --prompt.foreground "#89b4fa" \
        --selected.background "#89b4fa" \
        --selected.foreground "#1e1e2e" \
        --unselected.foreground "#6c7086"
end
