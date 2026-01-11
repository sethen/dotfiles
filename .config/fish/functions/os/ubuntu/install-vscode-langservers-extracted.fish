#!/usr/bin/env fish

function install-vscode-langservers-extracted
  running-message "install-vscode-langservers-extracted"

  if type -q vscode-html-language-server
    success-message 'vscode-langservers-extracted already installed'
  else
    information-message 'installing vscode-langservers-extracted'

    npm install -g vscode-langservers-extracted
  end
end
