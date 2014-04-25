$packageName = 'cr_for_vs'
$installerType = 'EXE'
$url = 'http://downloads.businessobjects.com/akdlm/cr4vs2010/CRforVS_13_0_9.exe'
$url64 = ''
$silentArgs =
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
