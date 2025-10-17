#!/bin/fish

function git-branch-name
  if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
    echo "currently not in a git repository"

    return 2
  end

  git symbolic-ref --short HEAD
end
