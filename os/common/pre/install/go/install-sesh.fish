#!/usr/bin/env fish

function install-sesh
    running-message install-sesh

    if type -q sesh
        success-message "sesh already installed"
    else
        information-message "installing sesh"

        go install github.com/joshmedeski/sesh/v2@latest
    end
end
