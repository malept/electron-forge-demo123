#!/usr/bin/env bash
#
# See: https://docs.microsoft.com/en-us/windows/win32/appxpkg/how-to-create-a-package-signing-certificate
#

set -ex

program_files_x86="/c/Program Files (x86)"
windows_kit_bindir="$program_files_x86/Windows Kits/10/bin"
ver=`(cd "$windows_kit_bindir"; ls -dr 10.*) | sed -e 1q`
sdk_path="$windows_kit_bindir/$ver/x64"

PATH="$sdk_path:$PATH"

# Create a private key using MakeCert.exe
MakeCert.exe -n CN=ElectronForgeCI -r -h 0 -eku "1.3.6.1.5.5.7.3.3,1.3.6.1.4.1.311.10.3.13" -e 12/31/2050 -sv ci/codesign.pvk ci/codesign.cer

Pvk2Pfx.exe -pvk ci/codesign.pvk -spc ci/codesign.cer -pfx ci/codesign.pfx
