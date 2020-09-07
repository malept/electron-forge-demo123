#!/usr/bin/env bash
#
# See: https://docs.microsoft.com/en-us/windows/win32/appxpkg/how-to-create-a-package-signing-certificate
#

# Create a private key using MakeCert.exe
MakeCert.exe /n ElectronForgeCI /r /h 0 /eku "1.3.6.1.5.5.7.3.3,1.3.6.1.4.1.311.10.3.13" /e 12/31/2050 /sv ci/codesign.pvk ci/codesign.cer

Pvk2Pfx.exe /pvk ci/codesign.pvk /spc ci/codesign.cer /pfx ci/codesign.pfx
