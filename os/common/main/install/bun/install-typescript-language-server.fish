#!/usr/bin/env fish

function install-typescript-language-server
    running-message install-typescript-language-server

    if type -q typescript-language-server
        success-message "typescript-language-server installed"
    else
        information-message "installing typescript-language-server"

        bun add -g typescript-language-server
    end
end
