
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.microsoft.com/download/4/9/1/491251F7-46BA-46EC-B2B5-099155DD3C27/AzInfoProtection_ul_MSI_for_central_deployment.msi'
        
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'MSI'
    url            = $url

    softwareName   = 'azure-information-protection-unified-labeling-client'

    checksum       = '163DBAE0AB66B1A8F7008A6AA5C727BFFCF34C3A2DFA2975D6D18EF3AAE3E339'
  
    checksumType   = 'sha256'

    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
