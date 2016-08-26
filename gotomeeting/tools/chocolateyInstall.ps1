$packageName = 'gotomeeting'
$installerType = 'MSI'
# The support page for downloading is: https://support.citrixonline.com/en_US/gotomeeting/downloaddocument/GTMD00053
# Which redirects the actual download to the following URL
$url = 'https://support.citrixonline.com/servlet/fileField?retURL=%2Fapex%2FCPDownloadStarter%3FarticleLinkId%3DG2MD00196%26l%3Den_US%26product%3DMeeting&entityId=ka338000000GtVFAA0&field=Content__Body__s'
$silentArgs = '/q ALLUSERS=1'
$validExitCodes = @(0)

try
{
  $tempDir = Join-Path $(Join-Path $env:TEMP "chocolatey") "$packageName"
  $msiFile = "G2MSetup7.17.4911_IT.msi"
  $zipFile = "G2MSetup7.17.4911_IT.zip"
  if (! [System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) }
  Get-ChocolateyWebFile "$packageName" "$(Join-Path $tempDir $zipFile)" $url
  Get-ChocolateyUnzip "$(Join-Path $tempDir $zipFile)" $tempDir "" "$packageName"
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$(Join-Path $tempDir $msiFile)" -validExitCodes $validExitCodes
}
catch
{
  throw $_
}
