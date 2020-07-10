#!/bin/bash -xe

npm run make -- --skip-package --platform $PLATFORM --targets=@electron-forge/maker-$MAKER
