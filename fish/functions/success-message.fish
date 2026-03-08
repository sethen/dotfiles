#!/usr/bin/env fish

function success-message
    if test (count $argv) -eq 0
        echo "usage: success-message <message>" >&2

        return 1
    end

    set message $argv

    set_color green --bold
    echo "  $message" >&2
    set_color normal
end
