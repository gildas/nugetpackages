$packageName = 'visionapp'
$installerType = 'EXE'
$url = 'http://cdn.visionapp.com/ASGRD_latest.zip'
$silentArgs = '/S'
$validExitCodes = @(0)

$tempDir   = Join-Path $(Join-Path $env:TEMP "chocolatey") "$packageName"
$exeFile   = "ASGRD_Setup.exe"
$zipFile   = "ASGRD_latest.zip"
$exePath   = Join-Path (Join-Path $tempDir 'ASGRD2016_Setup') $exeFile

if (! [System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) }
Get-ChocolateyWebFile "$packageName" "$(Join-Path $tempDir $zipFile)" $url
Get-ChocolateyUnzip -FileFullPath "$(Join-Path $tempDir $zipFile)" -Destination $tempDir -SpecificFolder '' -PackageName $packageName
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" $exePath -validExitCodes $validExitCodes
