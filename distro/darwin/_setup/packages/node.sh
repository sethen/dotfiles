#!/bin/zsh

brew-install-if-package-not-exists nvm
brew-install-if-package-not-exists node

if (( $+commands[bash-language-server] )); then
  success-message 'bash-language-server installed'
else
  information-message 'installing bash-language-server'

  npm install -g bash-language-server
fi

if (( $+commands[docker-langserver] )); then
  success-message 'dockerfile-langserver installed'
else
  information-message 'installing dockerfile-langserver'

  npm install -g dockerfile-language-server-nodejs
fi

if (( $+commands[vscode-html-language-server] )); then
  success-message 'vscode-langservers-extracted installed'
else
  information-message 'installing vscode-langservers-extracted'

  npm install -g vscode-langservers-extracted
fi

if (( $+commands[tsc] )); then
  success-message 'typescript installed'
else
  information-message 'installing typescript'

  npm install -g typescript
fi

if (( $+commands[typescript-language-server] )); then
  success-message 'typescript-language-server installed'
else
  information-message 'installing typescript-language-server'

  npm install -g typescript-language-server
fi

if (( $+commands[yaml-language-server] )); then
  success-message 'yaml-language-server installed'
else
  information-message 'installing yaml-language-server'

  npm install -g yaml-language-server
fi
