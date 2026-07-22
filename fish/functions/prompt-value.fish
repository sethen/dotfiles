#!/usr/bin/env fish

function prompt-value
    # usage: prompt-value <header> [default] [placeholder]
    if test (count $argv) -eq 0
        error-message "prompt-value: requires a header argument"

        return 1
    end

    if not type -q gum
        error-message "prompt-value: gum not found in PATH"

        return 1
    end

    set -l header $argv[1]
    set -l default_value $argv[2]
    set -l placeholder $argv[3]

    # catppuccin mocha: blue accent for icon/cursor/header, muted overlay for the example.
    # loop until a non-empty value is given — we never accept a blank answer
    set -l value
    while true
        set value (gum input \
            --prompt "  " \
            --prompt.foreground "#89b4fa" \
            --cursor.foreground "#89b4fa" \
            --header.foreground "#89b4fa" \
            --placeholder.foreground "#6c7086" \
            --header $header \
            --value "$default_value" \
            --placeholder "$placeholder")
        set -l gum_status $status

        # gum exits non-zero when cancelled (Ctrl-C / Esc) — quit the whole setup
        if test $gum_status -ne 0
            exit $gum_status
        end

        if test -n "$value"
            break
        end
    end

    echo $value
end
