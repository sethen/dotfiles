#!/usr/bin/env fish

function run-omarchy-all
    running-message run-omarchy-all

    # main
    run-common-main
    run-omarchy-main

    # post
    run-common-post
end
