#!/bin/zsh

header_message 'os setup'

check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/os/install/rust.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/os/install/tpm.sh
check_if_file_exists_executable $PRESENT_WORKING_DIRECTORY/os/install/zsh-autosuggestions.sh
