#!/bin/bash -xe

case "$(uname -s)" in
    "Linux")
        if [[ -n "$GITHUB_WORKFLOW" ]]; then
            # Work around outdated apt repository keys, etc.
            grep -l opensuse /etc/apt/sources.list.d/* | xargs sudo rm
        fi
        if [[ "$MAKER" = "flatpak" || -n "$APPVEYOR" ]]; then
          "$(dirname $0)"/install_flatpak_dependencies.sh
        fi
esac
