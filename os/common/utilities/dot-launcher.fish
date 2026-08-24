#!/usr/bin/env fish

function dot-launcher
    if not type -q gum
        error-message "gum not found in PATH; cannot run dot-launcher"
        return 1
    end

    set -l TARGET_FUNCTIONS

    for func in (functions -n)
        set -l func_info (functions -v $func | string collect)

        if string match -q "*$DOTFILES_DIRECTORY*" "$func_info"
            if test "$func" != dot-launcher
                set -a TARGET_FUNCTIONS $func
            end
        end
    end

    if test (count $TARGET_FUNCTIONS) -eq 0
        echo "No local functions found in: $DOTFILES_DIRECTORY"
        return
    end

    set -l SELECTED (printf "%s\n" $TARGET_FUNCTIONS | gum filter \
        --header "Dot Launcher")

    if test -z "$SELECTED"
        return
    end

    # strip comments first: a function that merely mentions $argv in a comment
    # would otherwise prompt for arguments it never reads
    if functions $SELECTED | string replace -r '#.*' '' | grep -qw '\$argv'
        set -l ARGS (gum input --header "arguments for $SELECTED")
        $SELECTED (string split ' ' -- $ARGS)
    else
        $SELECTED
    end
end
