#!/usr/bin/env fish

function write-plugin-manifest
    # write-plugin-manifest <packaged-manifest> <clone-id> <destination>
    #
    # A clone's manifest is the packaged one with a new identity, so it is
    # derived rather than tracked. This mirrors omarchy-plugin-clone exactly:
    # the id and name change, barWidget.displayName follows the name, clonedFrom
    # records the built-in so the shell can route IPC calls made to the original
    # id, and clonePaths is dropped because the clone already has those files.

    set -l packaged $argv[1]
    set -l clone_id $argv[2]
    set -l destination $argv[3]

    if not test -f $packaged
        error-message "write-plugin-manifest: packaged manifest not found: $packaged"
        return 1
    end

    # omarchy names a clone "My <Name>", taken from the packaged manifest.
    set -l display_name "My "(jq -r '.name' $packaged)
    set -l source_id (jq -r '.id' $packaged)

    jq \
        --arg id $clone_id \
        --arg name $display_name \
        --arg sourceId $source_id '
            .id = $id |
            .name = $name |
            if (.barWidget | type) == "object" then
                .barWidget.displayName = $name
            else
                .
            end |
            .omarchy = (
                (if (.omarchy | type) == "object" then .omarchy else {} end) +
                { clonedFrom: $sourceId }
            ) |
            del(.omarchy.clonePaths)
        ' $packaged >$destination/manifest.json

    or begin
        error-message "write-plugin-manifest: could not derive manifest for $clone_id"
        return 1
    end
end
