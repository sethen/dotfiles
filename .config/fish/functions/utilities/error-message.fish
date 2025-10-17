#!/bin/fish

function error-message
  if test (count $argv) -eq 0
    echo "usage: error-message <message>" >&2

    return 1
  end

  set message $argv

  set_color red --bold
  echo "  $message" >&2
  set_color normal
end
