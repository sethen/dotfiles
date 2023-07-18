#!/bin/zsh

EMACS_LIGATURE_DIRECTORY=$DEVELOPER_DIRECTORY/ligature.el

if [[ ! -d $EMACS_LIGATURE_DIRECTORY ]]; then
    information-message 'installing emacs-ligature'

    git clone git@github.com:mickeynp/ligature.el.git $EMACS_LIGATURE_DIRECTORY
else
    success-message 'emacs-ligature installed'
fi
