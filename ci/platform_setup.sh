#!/bin/bash

case "$(uname -s)" in
    "Linux")
        "$(dirname $0)"/install_snap_dependencies.sh
        ;;
    "Darwin")
        "$(dirname $0)"/codesign/import-testing-cert-ci.sh
        ;;
esac
