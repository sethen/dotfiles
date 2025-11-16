#!/usr/bin/env fish

function header-message
  if test (count $argv) -eq 0
    echo "usage: header-message <message>" >&2

    return 1
  end

  set message $argv

  set_color blue --bold
  echo "  $message" >&2
  set_color normal
end
