#!/bin/bash -xe

case "$(uname -s)" in
    "Linux")
        if [[ -n "$GITHUB_WORKFLOW" ]]; then
            # Work around outdated apt repository keys, etc.
            sudo rm /etc/apt/sources.list.d/bazel.list
        fi
        if [[ "$MAKER" = "deb" || -n "$APPVEYOR" ]]; then
          sudo apt-get install --yes --no-install-recommends fakeroot dpkg
        fi
        if [[ "$MAKER" = "rpm" || -n "$APPVEYOR" ]]; then
          sudo apt-get install --yes --no-install-recommends rpm
        fi
        if [[ "$MAKER" = "flatpak" || -n "$APPVEYOR" ]]; then
          "$(dirname $0)"/install_flatpak_dependencies.sh
        fi
        if [[ "$MAKER" = "snap" || -n "$APPVEYOR" ]]; then
          "$(dirname $0)"/install_snap_dependencies.sh
        fi
        ;;
    "Darwin")
        "$(dirname $0)"/codesign/import-testing-cert-ci.sh
        ;;
    "Windows"*|"MINGW"*|"MSYS"*)
        "$(dirname $0)"/setup-windows-certificate.sh
        ;;
esac
