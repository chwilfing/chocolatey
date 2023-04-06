
$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.microsoft.com/download/4/9/1/491251F7-46BA-46EC-B2B5-099155DD3C27/AzInfoProtection_UL.msi'
             
             
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI'
  url            = $url

  softwareName   = 'azure-information-protection-client'

  checksum       = '97A35D19F43ADC98938238568A6F3BEF9830C32F8C5C1FF4E3C1B3AD26FB7204'
  checksumType   = 'sha256'

  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
