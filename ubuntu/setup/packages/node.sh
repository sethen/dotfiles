#!/bin/zsh

if [[ -d $NVM_DIRECTORY ]]; then
    success-message 'nvm, node and node modules installed'
else
    information-message 'installing nvm'

    PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash

    . $NVM_DIRECTORY/nvm.sh

    # install node
    information-message 'installing node'

    nvm install node

    # install bash language server
    information-message 'installing bash-language-server'

    npm install -g bash-language-server

    # install dockerfile language server
    information-message 'installing dockerfile-langserver'

    npm install -g dockerfile-language-server-nodejs

    # install typescript
    information-message 'installing typescript'

    npm install -g typescript

    # install typescript language server
    information-message 'installing typescript-language-server'

    npm install -g typescript-language-server

    # install vscode langservers extracted
    information-message 'installing vscode-langservers-extracted'

    npm install -g vscode-langservers-extracted

    # install yaml language server
    information-message 'installing yaml-language-server'

    npm install -g yaml-language-server
fi
