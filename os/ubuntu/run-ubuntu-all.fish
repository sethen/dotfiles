#!/usr/bin/fish

function run-ubuntu-all
  running-message "run-ubuntu-all"

  # main
  run-common-main
  run-ubuntu-main

  # post
  run-common-post
end
