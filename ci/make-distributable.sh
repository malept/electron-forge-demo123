#!/bin/bash -xe

yarn make --skip-package --targets=@electron-forge/maker-$MAKER
