#!/bin/zsh

apt-get-install-if-package-not-exists gh

local ID_PUB=$(ls ~/.ssh/id_*.pub)

if [[ ! -n $ID_PUB ]]; then
    information-message 'logging into to github'

    gh auth login

    echo ''
fi
