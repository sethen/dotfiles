#!/usr/bin/env fish

function switch-shell-to-fish
    running-message switch-shell-to-fish

    set -l fish_path (command -v fish)

    if test -z "$fish_path"
        error-message "fish not found in PATH"
        return 1
    end

    if not contains "$fish_path" (cat /etc/shells)
        echo "$fish_path" | sudo tee -a /etc/shells
    end

    if test "$SHELL" != "$fish_path"
        information-message "switching shell to fish, you may need to re-login"

        chsh -s "$fish_path"
    else
        success-message "shell is already fish"
    end
end
