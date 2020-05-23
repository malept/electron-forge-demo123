#!/bin/bash

case "$(uname -s)" in
    "Linux")
        sudo apt-get install -y --no-install-recommends dpkg fakeroot rpm
        if [[ -n "$GITHUB_WORKFLOW" ]]; then
            # Work around outdated apt repository keys, etc.
            sudo rm /etc/apt/sources.list.d/bazel.list
        fi
        "$(dirname $0)"/install_flatpak_dependencies.sh
        "$(dirname $0)"/install_snap_dependencies.sh
        ;;
    "Darwin")
        "$(dirname $0)"/codesign/import-testing-cert-ci.sh
        ;;
esac
