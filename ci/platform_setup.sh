#!/bin/bash -xe

case "$(uname -s)" in
    "Linux")
        if [[ -n "$GITHUB_WORKFLOW" ]]; then
            # Work around outdated apt repository keys, etc.
            sudo rm /etc/apt/sources.list.d/bazel.list
            grep -l opensuse /etc/apt/sources.list.d/* | xargs sudo rm
        fi
        ;;
    "Darwin")
        "$(dirname $0)"/codesign/import-testing-cert-ci.sh
        ;;
esac
