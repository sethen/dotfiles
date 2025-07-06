#!/bin/zsh

if [[ ! -a $ETC_APT_SOURCES_DIRECTORY/brave-browser-release.sources ]]; then
  information-message 'adding brave-browser repository'

  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
else
  success-message 'brave-browser repository already added'
fi
