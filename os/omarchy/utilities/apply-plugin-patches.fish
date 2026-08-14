#!/usr/bin/env fish

function apply-plugin-patches
    # apply-plugin-patches <patches-file> <plugin-id> <destination>
    #
    # Re-applies our edits to a freshly copied clone. Prints the number applied
    # on stdout; reports anything that no longer matches and returns 1, which is
    # the signal omarchy rewrote the code an edit anchors to and a glyph would
    # otherwise revert without warning.

    set -l patches_file $argv[1]
    set -l plugin $argv[2]
    set -l destination $argv[3]

    set -l applied 0
    set -l stale 0

    set -l file_count (jq -r --arg plugin $plugin '(.[$plugin] // []) | length' $patches_file)

    for file_index in (seq 0 (math $file_count - 1))
        set -l relative (jq -r --arg plugin $plugin --argjson i $file_index '.[$plugin][$i].file' $patches_file)
        set -l target $destination/$relative

        if not test -f $target
            error-message "$plugin/$relative: file no longer exists upstream"
            set stale (math $stale + 1)
            continue
        end

        set -l edit_count (jq -r --arg plugin $plugin --argjson i $file_index '.[$plugin][$i].edits | length' $patches_file)

        # string collect trims trailing newlines, and string replace adds one to
        # its output. Work trimmed and write exactly one back, so a file does not
        # gain a blank line per edit applied.
        set -l content (cat $target | string collect)

        for edit_index in (seq 0 (math $edit_count - 1))
            set -l find (jq -r --arg plugin $plugin --argjson i $file_index --argjson j $edit_index '.[$plugin][$i].edits[$j].find' $patches_file | string collect)
            set -l replace (jq -r --arg plugin $plugin --argjson i $file_index --argjson j $edit_index '.[$plugin][$i].edits[$j].replace' $patches_file | string collect)

            # string replace reports 1 when nothing matched. $status would come
            # from string collect here, so read the first stage's status.
            set -l updated (string replace -- $find $replace $content | string collect)

            if test $pipestatus[1] -ne 0
                error-message "$plugin/$relative: anchor no longer matches"
                set stale (math $stale + 1)
                continue
            end

            set content $updated
            set applied (math $applied + 1)
        end

        printf '%s\n' $content >$target
    end

    echo $applied

    test $stale -eq 0
end
