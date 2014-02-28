$packageName = 'visionapp'
$installerType = 'EXE'
$url = 'http://cdn.visionapp.com/ASG-RD2012_P8_Plain.zip'
$silentArgs = '/S'
$validExitCodes = @(0)

try
{
  $tempDir = Join-Path $(Join-Path $env:TEMP "chocolatey") "$packageName"
  $exeFile = "ASGRD_Setup.exe"
  $zipFile = "ASG-RD2012_P8_Plain.zip"

  if (! [System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) }
  Get-ChocolateyWebFile "$packageName" "$(Join-Path $tempDir $zipFile)" $url
  Get-ChocolateyUnzip "$(Join-Path $tempDir $zipFile)" $tempDir "" "$packageName"
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$(Join-Path $tempDir $exeFile)" -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName"
}
catch
{
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
