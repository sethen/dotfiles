#!/usr/bin/env fish

function information-message
    if test (count $argv) -eq 0
        echo "usage: information-message <message>" >&2

        return 1
    end

    set message $argv

    set_color yellow --bold
    echo "  $message" >&2
    set_color normal
end
