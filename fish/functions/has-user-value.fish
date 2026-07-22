#!/usr/bin/env fish

function has-user-value
    # usage: has-user-value <name> — true if <name> was captured in user.fish
    if test (count $argv) -eq 0
        error-message "has-user-value: requires a variable name"

        return 1
    end

    set -l file $DOTFILES_DIRECTORY/user.fish

    test -f $file; and grep -q "^set -gx $argv[1] " $file
end
