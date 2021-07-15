C:\ProgramData\chocolatey\lib\wixtoolset\tools\wix311.exe /install /quiet /norestart

$wixToolsetBinPath = ";C:\Program Files (x86)\WiX Toolset v3.11\bin;"
$env:PATH = $env:PATH + $wixToolsetBinPath
[Environment]::SetEnvironmentVariable("Path", $env:PATH, [EnvironmentVariableTarget]::Machine)
if ((Get-Command "light.exe" -ErrorAction SilentlyContinue) -eq $null)
{
  Write-Host "Unable to find light.exe in your PATH"
}
