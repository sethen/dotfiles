#!/bin/zsh

if (( $+commands[go] )); then
  success-message "golang installed"
else
  information-message "installing golang"

  GO_DOWNLOAD_DIRECTORY=go-$GO_VERSION

  wget -O ~/$GO_DOWNLOAD_DIRECTORY.tar.gz https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
  sudo tar -xvf ~/$GO_DOWNLOAD_DIRECTORY.tar.gz -C /usr/local

  rm -rf ~/$GO_DOWNLOAD_DIRECTORY.tar.gz
fi

if (( $+commands[lazydocker] )); then
  success-message 'lazydocker installed'
else
  if [[ -f $GO_BIN ]]; then
    information-message 'installing lazydocker'

    $GO_BIN install github.com/jesseduffield/lazydocker@latest
  else
    error-message 'golang binary not found'
  fi
fi
