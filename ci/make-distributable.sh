#!/bin/bash -xe

DEBUG=electron-forge:* yarn make --skip-package --targets=@electron-forge/maker-$MAKER
