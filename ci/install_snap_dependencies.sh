#!/bin/bash -xe

sudo apt update

mkdir -p fakesnap/snap
cp ci/snapcraft.yaml fakesnap/snap/
pushd fakesnap
snapcraft pull desktop-gtk3 electron-deps
popd
rm -r fakesnap
