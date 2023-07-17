#!/bin/zsh

if [[ ! -a $ETC_APT_SOURCES_DIRECTORY/vscode.list ]]; then
    information_message 'adding visual-studio-code repository'

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
else
    success_message 'visual-studio-code key and repository already added'
fi
