#!/bin/zsh

if (( $+commands[bob] )); then
  success-message "bob installed"
elif (( $+commands[cargo] )); then
  information-message 'installing bob'

  cargo install --git https://github.com/MordechaiHadad/bob --locked
else
  error-message 'cargo not found'
fi
