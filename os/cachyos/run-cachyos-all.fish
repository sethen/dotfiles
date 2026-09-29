#!/usr/bin/env fish

function run-cachyos-all
    running-message run-cachyos-all

    # main
    run-common-main
    run-cachyos-main

    # post
    run-common-post
end
