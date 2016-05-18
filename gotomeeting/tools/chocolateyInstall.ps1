$packageName = 'gotomeeting'
$installerType = 'MSI'
# The support page for downloading is: http://support.citrixonline.com/en_US/gotomeeting/downloaddocument/GTMD00053
# Which redirects the actual download to the following URL
$url = 'http://support.citrixonline.com/servlet/fileField?retURL=%2Fapex%2FCPDownloadStarter%3FarticleLinkId%3DGTMD00053%26l%3Den_US%26product%3Dgotomeeting&entityId=ka350000000TgcUAAS&field=Content__Body__s'
http://support.citrixonline.com/en_US/meeting/all_files/G2M010013
$silentArgs = '/q ALLUSERS=1'
$validExitCodes = @(0)

try
{
  $tempDir = Join-Path $(Join-Path $env:TEMP "chocolatey") "$packageName"
  $msiFile = "G2MSetup6.1.1312_IT.msi"
  $zipFile = "G2M_U.S._v6.1.2_b1312_MSI.zip"

  if (! [System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) }
  Get-ChocolateyWebFile "$packageName" "$(Join-Path $tempDir $zipFile)" $url
  Get-ChocolateyUnzip "$(Join-Path $tempDir $zipFile)" $tempDir "" "$packageName"
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$(Join-Path $tempDir $msiFile)" -validExitCodes $validExitCodes
}
catch
{
  throw $_
}
