$packageName = 'turtlemine'
$installerType = 'MSI'
$url = 'http://turtlemine.googlecode.com/files/TurtleMine_32bit_1.2.0.1.msi'
$url64 = 'http://turtlemine.googlecode.com/files/TurtleMine_64bit_1.2.0.1.msi'
$silentArgs = '/q'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
