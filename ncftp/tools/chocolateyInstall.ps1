$packageName = 'ncftp'
$installerType = 'MSI'
$url = 'ftp://ftp.ncftp.com/ncftp/binaries/Setup%20NcFTP%203.2.5.msi'
$silentArgs = '/q' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" ""  -validExitCodes $validExitCodes
