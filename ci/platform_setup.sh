#!/bin/bash -xe

case "$(uname -s)" in
    "Linux")
        if [[ "$MAKER" = "flatpak" || -n "$APPVEYOR" ]]; then
          "$(dirname $0)"/install_flatpak_dependencies.sh
        fi
esac
