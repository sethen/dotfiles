#!/bin/zsh

echo ''
header-message 'distro init'
echo ''

if [[ -a $DISTRO_ALIASES_FILE ]]; then
  echo '\n' >> $HOME_ALIASES_FILE
  cat $DISTRO_ALIASES_FILE >> $HOME_ALIASES_FILE
fi

if [[ -a $DISTRO_ZSHRC_FILE ]]; then
  echo '\n' >> $HOME_ZSHRC_FILE
  cat $DISTRO_ZSHRC_FILE >> $HOME_ZSHRC_FILE
fi

if [[ -a $DISTRO_ZSHENV_FILE ]]; then
  echo '\n' >> $HOME_ZSHENV_FILE
  cat $DISTRO_ZSHENV_FILE >> $HOME_ZSHENV_FILE
fi

if [[ -d $DISTRO_ZSH_FUNCTIONS_DIRECTORY ]]; then
  information-message 'copying zsh functions'

  for DISTRO_ZSH_FUNCTION in $DISTRO_ZSH_FUNCTIONS_DIRECTORY/*; do
    ln -sfv $DISTRO_ZSH_FUNCTION $HOME_ZSH_FUNCTIONS_DIRECTORY

    local FILENAME=$DISTRO_ZSH_FUNCTION:t

    echo "autoload -Uz $FILENAME" >> ~/.zshenv
  done
fi

. $HOME_ZSHENV_FILE
. $HOME_ZSHRC_FILE
