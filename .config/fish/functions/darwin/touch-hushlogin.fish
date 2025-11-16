#!/usr/bin/env fish

function touch-hushlogin
  running-message "touch-hushlogin"

  set -l HUSHFILE $HOME/.hushlogin

  if not test -f $HUSHFILE
    information-message "touching .hushlogin"

    touch $HUSHFILE
  else
    success-message ".hushlogin is already touched"
  end
end
