#!/bin/zsh

cp -f $PRESENT_WORKING_DIRECTORY/os/.zshenv ~ && . ~/.zshenv
cp -f $PRESENT_WORKING_DIRECTORY/os/.zshrc ~

if [[ -d $HOME_ZSH_FUNCTIONS_DIRECTORY ]]; then
  rm -rf $HOME_ZSH_FUNCTIONS_DIRECTORY
fi

mkdir -p $HOME_ZSH_FUNCTIONS_DIRECTORY

if [[ -d $OS_ZSH_FUNCTIONS_DIRECTORY ]]; then
  for OS_ZSH_FUNCTION in $OS_ZSH_FUNCTIONS_DIRECTORY/*; do
    ln -sfv $OS_ZSH_FUNCTION $HOME_ZSH_FUNCTIONS_DIRECTORY

    local FILENAME=$OS_ZSH_FUNCTION:t

    echo "autoload -Uz $FILENAME" >> $HOME_ZSHENV_FILE
  done
fi

. $HOME_ZSHENV_FILE

echo ''
header-message 'os init'
echo ''

if [[ -a $HOME_ALIASES_FILE ]]; then
  rm $HOME_ALIASES_FILE
fi

cp -f $OS_ALIASES_FILE ~

if [[ ! -d $DEVELOPER_DIRECTORY ]]; then
  mkdir -p $DEVELOPER_DIRECTORY
fi

if [[ ! -d $CONFIG_DIRECTORY ]]; then
  mkdir -p $CONFIG_DIRECTORY
fi

for FILE in $PRESENT_WORKING_DIRECTORY/os/.config/*; do
  symlink-file-to-dest $FILE $CONFIG_DIRECTORY
done

symlink-file-to-dest $PRESENT_WORKING_DIRECTORY/os/.gitconfig ~
symlink-file-to-dest $PRESENT_WORKING_DIRECTORY/os/.gitignore_global ~
