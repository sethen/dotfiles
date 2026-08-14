#!/usr/bin/env fish

function apply-plugin-patches
    # apply-plugin-patches <patches-file> <plugin-id> <destination>
    #
    # Re-applies our changes to a freshly copied clone, in two passes.
    #
    #   glyphs  a codepoint map, substituted file-wide. Icon choices live here
    #           rather than inside a context match, so no amount of upstream
    #           reformatting can break them and changing an icon is a one-line
    #           edit to the map.
    #   edits   find/replace pairs, for the changes that add or restructure
    #           lines and so need an anchor. Anchors avoid glyph-bearing lines
    #           wherever possible, so swapping an icon cannot invalidate one.
    #
    # Prints the number of changes applied on stdout. Reports anything that no
    # longer matches and returns 1, which is the signal omarchy rewrote the code
    # an edit anchors to and a glyph would otherwise revert without warning.

    set -l patches_file $argv[1]
    set -l plugin $argv[2]
    set -l destination $argv[3]

    set -l applied 0
    set -l stale 0

    # ------------------------------------------------------------ glyph passes
    for relative in (jq -r --arg plugin $plugin '(.[$plugin].glyphs // {}) | keys[]' $patches_file)
        set -l target $destination/$relative

        if not test -f $target
            error-message "$plugin/$relative: file no longer exists upstream"
            set stale (math $stale + 1)
            continue
        end

        set -l content (cat $target | string collect)

        for pair in (jq -r --arg plugin $plugin --arg file $relative '.[$plugin].glyphs[$file] | to_entries[] | "\(.key) \(.value)"' $patches_file)
            set -l codepoints (string split ' ' $pair)

            # \u takes exactly four hex digits, and most of these icons are five
            # (Material's range starts at U+F0000). Pad to eight and use \U.
            # The hex digits must follow \U literally, so pad first and build
            # the escape in a second printf.
            set -l from (printf "\\U"(printf '%08x' 0x$codepoints[1]))
            set -l to (printf "\\U"(printf '%08x' 0x$codepoints[2]))

            set -l updated (string replace --all -- $from $to $content | string collect)

            if test $pipestatus[1] -ne 0
                error-message "$plugin/$relative: glyph U+$codepoints[1] not found"
                set stale (math $stale + 1)
                continue
            end

            set content $updated
            set applied (math $applied + 1)
        end

        printf '%s\n' $content >$target
    end

    # ------------------------------------------------------------ edit passes
    set -l edit_count (jq -r --arg plugin $plugin '(.[$plugin].edits // []) | length' $patches_file)

    for edit_index in (seq 0 (math $edit_count - 1))
        set -l relative (jq -r --arg plugin $plugin --argjson i $edit_index '.[$plugin].edits[$i].file' $patches_file)
        set -l target $destination/$relative

        if not test -f $target
            error-message "$plugin/$relative: file no longer exists upstream"
            set stale (math $stale + 1)
            continue
        end

        set -l find (jq -r --arg plugin $plugin --argjson i $edit_index '.[$plugin].edits[$i].find' $patches_file | string collect)
        set -l replace (jq -r --arg plugin $plugin --argjson i $edit_index '.[$plugin].edits[$i].replace' $patches_file | string collect)

        # string collect trims trailing newlines, and string replace adds one to
        # its output. Work trimmed and write exactly one back, so a file does not
        # gain a blank line per edit applied.
        set -l content (cat $target | string collect)

        # string replace reports 1 when nothing matched. $status would come from
        # string collect here, so read the first stage's status.
        set -l updated (string replace -- $find $replace $content | string collect)

        if test $pipestatus[1] -ne 0
            error-message "$plugin/$relative: anchor no longer matches"
            set stale (math $stale + 1)
            continue
        end

        printf '%s\n' $updated >$target
        set applied (math $applied + 1)
    end

    echo $applied

    test $stale -eq 0
end
