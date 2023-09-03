#!/bin/zsh

if [[ -d $NVM_DIRECTORY ]]; then
    success-message 'nvm installed'
else
    information-message 'installing nvm'

    PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash

    . $NVM_DIRECTORY/nvm.sh
fi

if (( $+commands[node] )); then
    success-message 'node installed'
else
    information-message 'installing node'

    nvm install node
fi

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
