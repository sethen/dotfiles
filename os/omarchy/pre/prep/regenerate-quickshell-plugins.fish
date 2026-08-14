#!/usr/bin/env fish

function regenerate-quickshell-plugins
    running-message regenerate-quickshell-plugins

    # Omarchy's shell widgets bake their icons into the QML as literals, and QML
    # has no partial override, so changing one glyph means owning the whole
    # file. Keeping those copies would freeze them: upstream fixes stop
    # arriving, silently.
    #
    # So the clones are generated rather than tracked. Each is rebuilt from
    # whatever omarchy currently ships, its manifest is re-derived, and
    # quickshell/patches.json is applied on top. The repo carries the edits and
    # nothing else.
    #
    # They are built straight into ~/.config/omarchy/plugins, not into the repo
    # and symlinked back: nothing here is authored, so staging generated files
    # in the working tree would only put 300K of upstream copies where they look
    # tracked.
    #
    # Editing omarchy's own copies instead is not an option: omarchy-update runs
    # `pacman -Syu --overwrite '/usr/share/omarchy/*'`, which wipes anything put
    # there by design.

    set -l PLUGINS_DIRECTORY $HOME_CONFIG_DIRECTORY/omarchy/plugins
    set -l PATCHES_FILE $DOTFILES_DIRECTORY/quickshell/patches.json
    set -l OMARCHY (test -n "$OMARCHY_PATH"; and echo $OMARCHY_PATH; or echo /usr/share/omarchy)
    set -l SHELL_PLUGINS $OMARCHY/shell/plugins

    if not command -v jq >/dev/null
        error-message "regenerate-quickshell-plugins: jq is required to read patches.json"
        return 1
    end

    if not test -f $PATCHES_FILE
        error-message "regenerate-quickshell-plugins: patch table not found at $PATCHES_FILE"
        return 1
    end

    if not test -d $SHELL_PLUGINS
        error-message "regenerate-quickshell-plugins: omarchy shell plugins not found at $SHELL_PLUGINS"
        return 1
    end

    # clone id -> packaged source directory. Widgets that are a single file
    # inside a shared directory name that file; the rest copy their whole
    # directory. Held as parallel lists so the pairing stays readable.
    set -l CLONE_IDS sethen.agents sethen.audio sethen.bluetooth sethen.indicators sethen.media sethen.monitor sethen.network sethen.system-update sethen.weather sethen.workspaces
    set -l CLONE_SOURCES agents panels/audio panels/bluetooth bar/widgets services/media panels/monitor panels/network bar/widgets panels/weather bar/widgets
    set -l CLONE_FILES "" "" "" Indicators.qml "" "" "" SystemUpdate.qml "" Workspaces.qml

    set -l applied 0
    set -l failed 0

    for index in (seq (count $CLONE_IDS))
        set -l plugin $CLONE_IDS[$index]
        set -l source $SHELL_PLUGINS/$CLONE_SOURCES[$index]
        set -l single_file $CLONE_FILES[$index]
        set -l destination $PLUGINS_DIRECTORY/$plugin

        # A single-file widget shares its directory with its siblings, so the
        # packaged manifest sits beside it under the widget's own name.
        set -l packaged_manifest $source/manifest.json
        if test -n "$single_file"
            set packaged_manifest $source/(string replace .qml .manifest.json $single_file)
        end

        rm -rf $destination

        if not copy-packaged-plugin $source $destination $single_file
            set failed (math $failed + 1)
            continue
        end

        if not write-plugin-manifest $packaged_manifest $plugin $destination
            set failed (math $failed + 1)
            continue
        end

        # Indicators pulls its indicators/ directory from a sibling source
        # directory, which is what the packaged manifest's clonePaths records.
        if test $plugin = sethen.indicators
            cp -r $SHELL_PLUGINS/bar/indicators $destination/indicators
        end

        set -l count (apply-plugin-patches $PATCHES_FILE $plugin $destination)
        or set failed (math $failed + 1)

        set applied (math $applied + $count)

        information-message "rebuilt $plugin"
    end

    success-message "applied $applied edit(s)"

    if test $failed -gt 0
        error-message "$failed plugin(s) did not rebuild cleanly; omarchy changed the code they anchor to"
        return 1
    end
end
