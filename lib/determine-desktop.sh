#!/bin/zsh

if [[ `echo $XDG_CURRENT_DESKTOP | grep 'GNOME'` ]]; then
  export DESKTOP='gnome'
elif [[ -n `$XDG_CURRENT_DESKTOP | grep 'KDE'` ]]; then
  export DESKTOP='kde'
else
  echo 'desktop could not be determined'

  sleep 3
  exit 1
fi
