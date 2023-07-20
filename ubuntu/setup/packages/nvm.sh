#!/bin/zsh

if [[ -d $NVM_DIRECTORY ]]; then
    success-message 'nvm & node installed'
else
    information-message 'installing nvm & node'

    PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash
fi
