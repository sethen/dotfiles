#!/bin/zsh

apt_get_install_if_package_not_exists gh

local ID_PUB=$(ls ~/.ssh/id_*.pub)

if [[ ! -n $ID_PUB ]]; then
    information_message 'logging into to github'

    gh auth login

    echo ''
fi
