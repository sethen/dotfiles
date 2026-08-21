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

        # chsh prompts for a password and exits non-zero on a bad one. Without
        # this check a failed authentication scrolls past and the login shell
        # silently stays whatever it was
        if not chsh -s "$fish_path"
            error-message "chsh failed, login shell is still $SHELL"
            error-message "rerun: chsh -s $fish_path"

            return 1
        end
    else
        success-message "shell is already fish"
    end
end
