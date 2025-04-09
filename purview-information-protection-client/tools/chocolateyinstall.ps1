
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.microsoft.com/download/5e62f7f5-d616-49f8-b506-f1c6b4f79ba7/PurviewInfoProtection.msi'


$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'MSI'
    url            = $url

    softwareName   = 'Purview Information Protection Client'

    checksum       = '277C9463C8BF2EC50357DEF376615F5E65558EE9DA73C5D4B59648A09DAF2F36'

    checksumType   = 'sha256'

    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
