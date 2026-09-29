#!/usr/bin/env fish

function install-ffmpeg
    running-message install-ffmpeg

    yay-queue-package ffmpeg
end
