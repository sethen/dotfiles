#!/usr/bin/env fish

function switch-shell-to-fish
        running-message "switch-shell-to-fish"

        if test "$SHELL" != "/usr/bin/fish"
        information-message "switching shell to fish, you may need to re-login"

        chsh -s /usr/bin/fish
        else
        success-message "shell is already fish"
        end
end
