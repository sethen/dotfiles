#!/bin/zsh

if [[ ! -a $ETC_APT_SOURCES_DIRECTORY/vscode.list ]]; then
  information-message 'adding visual-studio-code repository and signing key'

  echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
else
  success-message 'visual-studio-code key and repository already added'
fi
