
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.microsoft.com/download/4/9/1/491251F7-46BA-46EC-B2B5-099155DD3C27/AzInfoProtection_UL.msi'

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'MSI'
    url            = $url

    softwareName   = 'Azure Information Protection Unified Labeling Client'

    checksum       = '4523C64A30037350BE393868CAC4EA0EA54B80C43A34009F56A948133ED4C44C'
  
    checksumType   = 'sha256'

    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
