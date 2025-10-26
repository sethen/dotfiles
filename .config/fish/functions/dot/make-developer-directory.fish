#!/bin/fish

function make-developer-directory
  running-message "make-developer-directory"

  if not test -d $DEVELOPER_DIRECTORY
    information-message "making developer directory"
    mkdir -p $DEVELOPER_DIRECTORY
  else
    success-message "developer directory already exists"
  end
end
