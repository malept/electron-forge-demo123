#!/bin/bash -xe

if test "$(uname -s)" = "Linux"; then
    sudo apt update

    mkdir -p fakesnap/snap
    cp ci/snapcraft.yaml fakesnap/snap/
    pushd fakesnap
    snapcraft pull desktop-gtk3 electron-deps
    popd
    rm -rf fakesnap
fi
