#!/bin/fish

function git-sha
  if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
    echo "currently not in a git repository"

    return 2
  end

  echo $(git rev-parse --short HEAD)
end
