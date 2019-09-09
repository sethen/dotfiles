#!/bin/zsh

header_message "running setup for ${DISTRO}"

check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/bitwarden.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/dockutil.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/golang.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/google-chrome.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/iterm2.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/nodejs.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/python3.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/spotify.sh
check_if_file_exists_executable ${SPECIFIC_OS_INSTALL}/visual-studio-code.sh
