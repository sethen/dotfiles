#!/bin/zsh

if type uname > /dev/null; then
  if [[ -n `uname -a | grep 'Ubuntu'` ]]; then
    export DISTRO='ubuntu'
  elif [[ -n `uname -a | grep 'Darwin'` ]]; then
    export DISTRO='darwin'
  else
    echo 'operating system not recognized'

    sleep 3
    exit 1
  fi
else
  echo 'operating system could not be determined'
fi
